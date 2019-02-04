# 初回準備

```
AWS_PROFILE=parade terraform init
```

# 起動方法

```
TF_VAR_ec2_key_name=key-pair-hogehoge AWS_PROFILE=parade terraform apply

---
TF_VAR_ec2_key_name = キーペア名
AWS_PROFILE = ~/.aws/credential 内にあるprofile名
```

# 削除方法

```
AWS_PROFILE=parade terraform destroy
```