eksctl utils associate-iam-oidc-provider \
  --cluster green-capstone \
  --region=us-east-2 \
  --approve

aws iam create-policy \
  --policy-name ALBIngressControllerIAMPolicy \
  --policy-document file:///iam-policy.json

