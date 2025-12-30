# serverless-fn を入れる（グローバルでもローカルでもOK）
npm i -D serverless serverless-fn

## Fn の context を OCI に向ける
fn use context <your-oci-context>

## serverless deploy（内部的に fn deploy 相当を叩くイメージ）
npx serverless deploy
