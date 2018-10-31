## docker-k8s.gcr.io
```
k8s.gcr.io/kube-apiserver:v1.12.2  
k8s.gcr.io/kube-controller-manager:v1.12.2  
k8s.gcr.io/kube-scheduler:v1.12.2  
k8s.gcr.io/kube-proxy:v1.12.2  
k8s.gcr.io/pause:3.1  
k8s.gcr.io/etcd:3.2.24  
k8s.gcr.io/coredns:1.2.2
k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.0
```
### docker pull images
```
docker pull registry.cn-shenzhen.aliyuncs.com/grc/kube-apiserver:v1.12.2
docker pull registry.cn-shenzhen.aliyuncs.com/grc/kube-controller-manager:v1.12.2
docker pull registry.cn-shenzhen.aliyuncs.com/grc/kube-scheduler:v1.12.2
docker pull registry.cn-shenzhen.aliyuncs.com/grc/kube-proxy:v1.12.2
docker pull registry.cn-shenzhen.aliyuncs.com/grc/pause:3.1
docker pull registry.cn-shenzhen.aliyuncs.com/grc/etcd:3.2.24
docker pull registry.cn-shenzhen.aliyuncs.com/grc/coredns:1.2.2
docker pull registry.cn-shenzhen.aliyuncs.com/grc/kubernetes-dashboard-amd64:v1.10.0
```

### docker tag images
```
docker tag registry.cn-shenzhen.aliyuncs.com/grc/kube-apiserver:v1.12.2 k8s.gcr.io/kube-apiserver:v1.12.2
docker tag registry.cn-shenzhen.aliyuncs.com/grc/kube-controller-manager:v1.12.2 k8s.gcr.io/kube-controller-manager:v1.12.2
docker tag registry.cn-shenzhen.aliyuncs.com/grc/kube-scheduler:v1.12.2 k8s.gcr.io/kube-scheduler:v1.12.2
docker tag registry.cn-shenzhen.aliyuncs.com/grc/kube-proxy:v1.12.2 k8s.gcr.io/kube-proxy:v1.12.2
docker tag registry.cn-shenzhen.aliyuncs.com/grc/pause:3.1 k8s.gcr.io/pause:3.1
docker tag registry.cn-shenzhen.aliyuncs.com/grc/etcd:3.2.24 k8s.gcr.io/etcd:3.2.24
docker tag registry.cn-shenzhen.aliyuncs.com/grc/coredns:1.2.2 k8s.gcr.io/coredns:1.2.2
docker tag registry.cn-shenzhen.aliyuncs.com/grc/kubernetes-dashboard-amd64:v1.10.0 k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.0
```

