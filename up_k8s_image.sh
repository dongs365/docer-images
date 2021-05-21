#!/bin/bash
#获取images列表
#基础镜像
im1=`kubeadm config images list`
#ui镜像
im2=`curl -s https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml|grep image: |awk '{print $2}'`
#网络镜像
im3=`curl -s https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml |grep image|uniq|awk '{print $2}'`
im4=`curl -s https://docs.projectcalico.org/manifests/calico.yaml |grep image|uniq|awk '{print $2}'`
#镜像汇总
ki=(`echo $im1 $im2 $im3 $im4`)
#创建目录
for i in ${ki[@]}; do mkdir `echo ${i}|awk -F / '{print $2}'|awk -F : '{print $1}'`; done
#创建dockerfile
for i in ${ki[@]}; do echo -e "FROM ${i}\nMAINTAINER dongs365" > `echo ${i}|awk -F / '{print $2}'|awk -F : '{print $1}'`/Dockerfile; done
mv coreos flannel
git add -A
git commit -m ":whale: `date`"
git push
