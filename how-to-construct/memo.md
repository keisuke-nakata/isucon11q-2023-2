# 環境立ち上げ

https://github.com/isucon/isucon11-qualify/tree/main/provisioning/cf-kakomon の cf.yaml をダウンロードし、アプリ3つ・ベンチの AMI を
https://github.com/matsuu/aws-isucon#ami に書かれているものに変更。
書き換え済みのものが [cf.yaml](cf.yaml)

cloud formation から↑のコンフィグを import してウィザードを進める。
key-pair だけ、事前に作っておいたやつを指定する。その他は何も設定せずに進む。

# 環境セットアップ

https://github.com/y011d4/inisucon からリリースファイルをローカルに落としてくる。
適当に設定ファイルを作成し、

```bash
./inisucon add -f CONFIG_PATH
./inisucon show
```

これで表示された ".ssh/config" をローカルの .ssh/config に追記して、各インスタンスに SSH 接続できるか確認。

# git init

github で repository を作成し、 `./inisucon show` で表示された "pubkey of deploy key" を deploy key に登録する (write アクセス付き)。
適当なインスタンスで以下を実行：

```bash
git init
git add .
git commit -m "initial"
git branch -M main
git remote add origin git@github.com:<repo>
git push -u origin main
```

他のインスタンスでは以下を実行：

```bash
mv <original_dir> <original_dir>.bk
git clone git@github.com:<repo> <original_dir>
```

# はじめての bench

https://github.com/matsuu/cloud-init-isucon/blob/main/isucon11q/README.md#bench を参考に、bench インスタンスで以下を実行：

```bash
./bench -all-addresses 192.168.0.11,192.168.0.12,192.168.0.13 -target 192.168.0.11:443 -tls -jia-service-url http://192.168.0.10:4999
```

# snapshot 準備

適当な場所から snapshot をパクってきて、config を書き換える。
そして init.sh を実行
