## ✅ STEP 1 — Install Reloader in EKS  
Using Helm:  
```bash
helm repo add stakater https://stakater.github.io/stakater-charts
helm repo update

helm install reloader stakater/reloader -n kube-system
```
## ✅ STEP 2 — Annotate your Deployments  
📁 backend/frontend **`deployment.yaml`**  
```yaml
template:
  metadata:
    annotations:
      reloader.stakater.com/auto: "true"
```
👉 That’s it.

## ✅ STEP 3 — Keep using your global ConfigMap normally  
```yaml
envFrom:
  - configMapRef:
      name: global-config
```
## 🔁 WHAT HAPPENS NOW  
**When ConfigMap changes:**  
```yaml
DB_HOST: new-endpoint  
```
👉 Flow:  

1. ConfigMap updated via Argo CD  
2. Reloader detects change  
3. Finds all deployments using it  
4. Triggers rolling restart automatically  

✅ frontend restarted  
✅ backend restarted  
✅ zero manual work  

## 🧪 VERIFY  
```bash
kubectl get pods -n shopverse-dev
```
👉 You’ll see pods restarting after ConfigMap change  
