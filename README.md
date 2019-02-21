# kubernetes images
## docker-k8s.gcr.io
```
k8s.gcr.io/kube-apiserver:v1.13.3  
k8s.gcr.io/kube-controller-manager:v1.13.3  
k8s.gcr.io/kube-scheduler:v1.13.3  
k8s.gcr.io/kube-proxy:v1.13.3  
k8s.gcr.io/pause:3.1  
k8s.gcr.io/etcd:3.2.24  
k8s.gcr.io/coredns:1.2.6
k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1
quay.io/coreos/flannel:v0.11.0-amd64
```
### docker pull images
```
docker pull registry.cn-shenzhen.aliyuncs.com/grc/kube-apiserver:v1.13.3
docker pull registry.cn-shenzhen.aliyuncs.com/grc/kube-controller-manager:v1.13.3
docker pull registry.cn-shenzhen.aliyuncs.com/grc/kube-scheduler:v1.13.3
docker pull registry.cn-shenzhen.aliyuncs.com/grc/kube-proxy:v1.13.3
docker pull registry.cn-shenzhen.aliyuncs.com/grc/pause:3.1
docker pull registry.cn-shenzhen.aliyuncs.com/grc/etcd:3.2.24
docker pull registry.cn-shenzhen.aliyuncs.com/grc/coredns:1.2.6
docker pull registry.cn-shenzhen.aliyuncs.com/grc/kubernetes-dashboard-amd64:v1.10.1
docker pull registry.cn-shenzhen.aliyuncs.com/grc/flannel:v0.11.0-amd64
```

### docker tag images
```
docker tag registry.cn-shenzhen.aliyuncs.com/grc/kube-apiserver:v1.13.3 k8s.gcr.io/kube-apiserver:v1.13.3
docker tag registry.cn-shenzhen.aliyuncs.com/grc/kube-controller-manager:v1.13.3 k8s.gcr.io/kube-controller-manager:v1.13.3
docker tag registry.cn-shenzhen.aliyuncs.com/grc/kube-scheduler:v1.13.3 k8s.gcr.io/kube-scheduler:v1.13.3
docker tag registry.cn-shenzhen.aliyuncs.com/grc/kube-proxy:v1.13.3 k8s.gcr.io/kube-proxy:v1.13.3
docker tag registry.cn-shenzhen.aliyuncs.com/grc/pause:3.1 k8s.gcr.io/pause:3.1
docker tag registry.cn-shenzhen.aliyuncs.com/grc/etcd:3.2.24 k8s.gcr.io/etcd:3.2.24
docker tag registry.cn-shenzhen.aliyuncs.com/grc/coredns:1.2.6 k8s.gcr.io/coredns:1.2.6
docker tag registry.cn-shenzhen.aliyuncs.com/grc/kubernetes-dashboard-amd64:v1.10.0 k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1
docker tag registry.cn-shenzhen.aliyuncs.com/grc/flannel:v0.11.0-amd64 quay.io/coreos/flannel:v0.11.0-amd64
```

### shell auto
```
images=(
    kube-apiserver:v1.13.3
    kube-controller-manager:v1.13.3
    kube-scheduler:v1.13.3
    kube-proxy:v1.13.3
    pause:3.1
    etcd:3.2.24
    coredns:1.2.6
    kubernetes-dashboard-amd64:v1.10.1
)
for imageName in ${images[@]} ; do
    docker pull registry.cn-shenzhen.aliyuncs.com/grc/$imageName
    docker tag registry.cn-shenzhen.aliyuncs.com/grc/$imageName k8s.gcr.io/$imageName ; done
```
