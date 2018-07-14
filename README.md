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

環境の判定は `netlify.toml` でやっている.

```
[context.production]
  command = "rake production"

[context.deploy-preview]
  command = "rake deploy_preview"
```

see also) https://www.netlify.com/blog/2017/04/07/selective-password-protection/
