# Delete ingress, name of ingress is blue-capstone-ingress
kubectl delete -f ingress.yaml

# Delete service
kubectl delete -f service.yaml

# Delete deployment
kubectl delete -f deployment.yaml

# Delete alb-ingress-gateway
helm -n blue-capstone delete blue-capstone

# Delete service account
eksctl delete iamserviceaccount \
  --name alb-ingress-controller \
  --namespace blue-capstone \
  --cluster green-capstone \
  --wait

# Delete Kubernetes RBAC
kubectl delete -f rbac-role.yaml 

# Delete Fargate profile
eksctl delete fargateprofile \
  --name green-capstone \
  --cluster blue-capstone

# Delete namespace
kubectl delete -f namespace.yaml

# Delete IAM policy
aws iam delete-policy --policy-arn $FARGATE_POLICY_ARN