#!/bin/bash
set -x
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
#下载images镜像
for i in ${kia[*]};do docker pull ${i}; done
for i in ${kib[*]};do docker pull ${i}; done
for i in ${kic[*]};do docker pull ${i}; done
for i in ${kid[*]};do docker pull ${i}; done
#新的images镜像名称
kaa=(`for i in ${kia[*]};do echo $i | sed 's/k8s.gcr.io/registry.cn-shenzhen.aliyuncs.com\/grc/'; done`)
kab=(`for i in ${kib[*]};do echo $i | sed 's/kubernetesui/registry.cn-shenzhen.aliyuncs.com\/grc/'; done`)
kac=(`for i in ${kic[*]};do echo $i | sed 's/quay.io\/coreos/registry.cn-shenzhen.aliyuncs.com\/grc/'; done`)
kad=(`for i in ${kid[*]};do echo $i | sed 's/calico/registry.cn-shenzhen.aliyuncs.com\/grc/'; done`)
#修改images标签
for ((i=0;i<${#kia[@]};i++));do docker tag  ${kia[i]} ${kaa[i]};done
for ((i=0;i<${#kib[@]};i++));do docker tag  ${kib[i]} ${kab[i]};done
for ((i=0;i<${#kic[@]};i++));do docker tag  ${kid[i]} ${kac[i]};done
for ((i=0;i<${#kid[@]};i++));do docker tag  ${kid[i]} ${kad[i]};done
#推送images
for i in ${kaa[*]};do echo $i | docker push ${i} ; done
for i in ${kab[*]};do echo $i | docker push ${i} ; done
for i in ${kac[*]};do echo $i | docker push ${i} ; done
for i in ${kad[*]};do echo $i | docker push ${i} ; done

