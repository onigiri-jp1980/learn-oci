# learn-oraclecloud
## このリポジトリについて
名前の通りOracleCloudをお勉強するための作業用コンテナです。ローカルのvenvとかHomebrewで賄うことができなくもないですが、
色々いじくり回わせるベースとして個別コンテナに閉じ込めたほうが都合いいかなーと思った次第です。
### 含まれているもの
#### Python 3.14
OCIのCLIに必要なので、Python3.14が使えます
#### Node.js 24
私個人はPythonかPHP方面の人間ですが、元々の目的が「OCI＋Serverless Frameworkごしでサーバレスを勉強しよう」というコンセプトでしたので、必要に迫られて、です。
##### oss-serverless(osls)
「OCIとslsの組み合わせを試したい」というのが主屋的なので不可欠ですね。本家は3.xから進めなくなっちゃったので、oss-serverlessでやらせてもらってます。
##### OpenTofu
何らかの思想や志があって「OSSじゃなきゃヤダ！」というわけではないですが、「シンプルに試してみたい」っていう技術的な興味ってやつですｗ

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
# 作業ディレクトリ/app(ホスト側:src/)でログイン
$ make bash
# 作業ディレクトリ/app/terraform(ホスト側:src/terraform/)でログイン
$ make terrafrom
# 作業ディレクトリ/app/severless(ホスト側:src/serverless/)でログイン
$ make serverless
```