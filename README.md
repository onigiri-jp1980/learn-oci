# learn-oraclecloud
## このリポジトリについて
名前の通りOracleCloudをお勉強するための作業用コンテナです。ローカルのvenvとかHomebrewで賄うことができなくもないですが、
色々いじくり回わせるベースとして個別コンテナに閉じ込めたほうが都合いいかなーと思った次第です。
### 含まれているもの
#### Python 3.14
OCIのCLIに必要なので、Python3.14が使えます
#### Node.js 24
元々の目的が「OCI＋Serverless Frameworkごしでサーバレスを勉強しよう」というコンセプトでしたのでね。
##### oss-serverless(osls)
本家は3.xから進めなくなっちゃったので、oss-serverlessでやらせてもらってます。

## 準備
### 環境設定ファイルの準備
```bash
# サンプルファイルからコピー
$ cp .env.example .env
# 実際のパラメータに合わせ`るように編集
$ nano .env
```

### コンテナのビルド
```bash
$ make build
```

### コンテナにログイン
```bash
$ make bash
```