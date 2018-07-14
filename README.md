# netlify-rake

- Rakefile
- Makefile

どちらもやってることは同じ. netlify ディレクトリから呼び出しの状況に応じて必要なファイルを cp しているだけ.
production では hugo のビルドのみ. deploy-preview 環境では Netlify Identity で管理される権限を持たないと
サイトを見られなくしている.

```
netlify
├── _headers
├── _redirects
└── login.html
```
