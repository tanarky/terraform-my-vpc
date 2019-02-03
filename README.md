# terraform-my-vpc

terraform-my-vpc

## 使い方

```
cd sample_dev
AWS_PROFILE=hoge terraform init
AWS_PROFILE=hoge terraform plan
AWS_PROFILE=hoge terraform apply
```

## 手順説明

```
1. (VPC) VPC作る
2. (VPC) インターネットゲートウェイ(IG)作る
3. (VPC) IGにVPCをアタッチ
4. (VPC) VPCのDNS設定(ホスト名の編集)をenableにする
5. (VPC) DHCPオプションセットを作成(domain-name=任意のdomain, domain-name-servers=AmazonProvidedDNS)して、VPCにattach
6. (VPC) subnet public a-c, private a-c 計4つ を作成
7. (VPC) デフォルトルートテーブルの 送信先=0.0.0.0/0 ターゲット=IGにする
8. (VPC) natgatewayとnatgw用のroute tableを作る
9. (VPC) private-a, private-cをnatgw route tableと紐付ける
10. (Route53) private domain設定
```

※ domain = sampl-dev.tokyo.aws となる -> 「最強のSSH踏み台設定」参照

## 補足

- vpcのみ、ssh踏み台サーバは上げていない
- natgwはsingle az(＝1つしか置いていない＝節約のため)

## 参考

- https://qiita.com/kawaz/items/a0151d3aa2b6f9c4b3b8
- https://github.com/miso4ru/aws-terraform-template
