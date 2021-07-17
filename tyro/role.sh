# create role
kubectl -n development create role developer-role --resource=pods,svc,pvc --verb="*"

# create rolebinding
kubectl -n development create rolebinding developer-rolebinding --role=developer-role --user=drogo

# kube config
kubectl config set-credentials drogo --client-certificate=/root/drogo.crt --client-key=/root/drogo.key

# create context
kubectl config set-context developer --cluster=kubernetes --user=drogo

# set context
kubectl config use-context developer