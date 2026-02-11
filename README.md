# M

## セットアップ手順

### 1. Supabase プロジェクトの準備

1. [Supabase](https://supabase.com/) でプロジェクトを作成
2. SQL Editor で `supabase-setup.sql` の内容を実行
3. Project Settings > API から URL と anon key を取得

### 2. 接続情報の設定

```bash
cp config.example.js config.js
```

`config.js` を編集し、Supabase の URL と anon key を設定：

```js
const SUPABASE_URL = 'https://your-project.supabase.co';
const SUPABASE_ANON_KEY = 'your-anon-key';
```

### 3. デプロイ

GitHub Pages や Netlify 等にデプロイしてください。
`config.js` は `.gitignore` に含まれているため、デプロイ先で別途設定が必要です。

---

## 動作確認チェックリスト

- [ ] Supabase SQL の実行完了
- [ ] config.js に Supabase 接続情報を設定
- [ ] 商品の追加・編集・削除ができる
- [ ] チェックの ON/OFF が動作する
- [ ] 別端末/別タブで開いて、リアルタイム同期される
- [ ] ホーム画面に追加で PWA として起動できる
- [ ] オフライン時にキャッシュ済みページが表示される

---

## ファイル構成

```
M/
├── index.html           # トップページ
├── bucketlist.html      # やりたいことリスト
├── letter.html          # レターページ
├── shopping.html        # お買い物リスト（新規）
├── config.js            # Supabase接続情報（.gitignore対象）
├── config.example.js    # config.jsのテンプレート
├── supabase-setup.sql   # Supabaseテーブル作成SQL
├── manifest.json        # PWAマニフェスト
├── sw.js                # Service Worker
├── offline.html         # オフラインフォールバック
├── icon-192.svg         # PWAアイコン (192x192)
├── icon-512.svg         # PWAアイコン (512x512)
├── .gitignore
├── pic/                 # トップページ用画像
└── memory/              # 年別思い出ページ + 写真
```
