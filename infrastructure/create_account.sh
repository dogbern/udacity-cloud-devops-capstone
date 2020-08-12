# Create IAM Serviceaccount
export FARGATE_POLICY_ARN=$(aws iam list-policies --query 'Policies[?PolicyName==`ALBIngressControllerIAMPolicy`].Arn' --output text)

eksctl create iamserviceaccount \
  --name alb-ingress-controller \
  --namespace green-capstone \
  --cluster green-capstone \
  --attach-policy-arn ${FARGATE_POLICY_ARN} \
  --approve \
  --override-existing-serviceaccounts

  # Create RBAC Role
  kubectl apply -f rbac-role.yaml
