#!/bin/bash
#获取images列表
#基础镜像
im1=`kubeadm config images list`
#ui镜像
im2=`curl -s https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml|grep image: |awk '{print $2}'`
#网络镜像
im3=`curl -s https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml |grep image|grep amd64|uniq|awk '{print $2}'`
im4=`curl -s https://docs.projectcalico.org/manifests/calico.yaml |grep image|uniq|awk '{print $2}'`
kia=(`echo $im1`)
kib=(`echo $im2`)
kic=(`echo $im3`)
kid=(`echo $im4`)
#新的images镜像名称
kaa=(`for i in ${kia[*]};do echo $i | sed 's/k8s.gcr.io/registry.cn-shenzhen.aliyuncs.com\/grc/'; done`)
kab=(`for i in ${kib[*]};do echo $i | sed 's/kubernetesui/registry.cn-shenzhen.aliyuncs.com\/grc/'; done`)
kac=(`for i in ${kic[*]};do echo $i | sed 's/quay.io\/coreos/registry.cn-shenzhen.aliyuncs.com\/grc/'; done`)
kad=(`for i in ${kid[*]};do echo $i | sed 's/calico/registry.cn-shenzhen.aliyuncs.com\/grc/'; done`)
#拉取 images
for i in ${kaa[*]};do echo $i | docker pull ${i} ; done
for i in ${kab[*]};do echo $i | docker pull ${i} ; done
for i in ${kac[*]};do echo $i | docker pull ${i} ; done
for i in ${kad[*]};do echo $i | docker pull ${i} ; done
#修改images标签
for ((i=0;i<${#kia[@]};i++));do docker tag  ${kaa[i]} ${kia[i]};done
for ((i=0;i<${#kib[@]};i++));do docker tag  ${kab[i]} ${kib[i]};done
for ((i=0;i<${#kic[@]};i++));do docker tag  ${kad[i]} ${kic[i]};done
for ((i=0;i<${#kid[@]};i++));do docker tag  ${kad[i]} ${kid[i]};done
