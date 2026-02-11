-- =============================================
-- お買い物リスト用 Supabase セットアップSQL
-- Supabase SQL Editor で実行してください
-- =============================================

-- shopping_items テーブルを作成
CREATE TABLE shopping_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,                          -- 商品名
    quantity INTEGER DEFAULT 1,                  -- 数量
    is_checked BOOLEAN DEFAULT false,            -- 購入済みチェック
    category TEXT,                               -- カテゴリ（任意）
    created_at TIMESTAMPTZ DEFAULT now(),         -- 作成日時
    updated_at TIMESTAMPTZ DEFAULT now()          -- 更新日時
);

-- RLS（Row Level Security）を無効にする（個人利用のため）
ALTER TABLE shopping_items DISABLE ROW LEVEL SECURITY;

-- Realtime を有効にする
ALTER PUBLICATION supabase_realtime ADD TABLE shopping_items;

-- updated_at を自動更新するトリガー関数
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- トリガーを shopping_items テーブルに適用
CREATE TRIGGER set_updated_at
    BEFORE UPDATE ON shopping_items
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();
