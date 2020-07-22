#!/bin/bash
#变量定义
images0=( 
 grafana/grafana:6.7.4
 directxman12/k8s-prometheus-adapter:v0.7.0
 quay.io/prometheus/node-exporter:v0.18.1
 quay.io/prometheus/alertmanager:v0.21.0
 quay.io/coreos/kube-state-metrics:v1.9.5
 quay.io/coreos/kube-rbac-proxy:v0.4.1
 quay.io/coreos/prometheus-operator:v0.40.0
 quay.io/prometheus/prometheus:v2.19.2
 prometheus-config-reloader:v0.40.0)
#修改镜像 
images1=`for i in ${images0[*]};do echo $i| sed 's/quay.io\/coreos/registry.cn-shenzhen.aliyuncs.com\/grc/'; done`
images2=`for i in ${images1[*]};do echo $i| sed 's/quay.io\/prometheus/registry.cn-shenzhen.aliyuncs.com\/grc/'; done`
images3=`for i in ${images2[*]};do echo $i| sed 's/directxman12/registry.cn-shenzhen.aliyuncs.com\/grc/'; done`
images4=(`for i in ${images3[*]};do echo $i| sed 's/grafana/registry.cn-shenzhen.aliyuncs.com\/grc/'; done`)
#选择菜单
function menu ()
{
cat << EOF
-------------------------------------------------
|***********************************************|
███╗   ███╗ ██████╗  ██████╗  ██████╗ ███╗   ███╗
████╗ ████║██╔═══██╗██╔═══██╗██╔═══██╗████╗ ████║
██╔████╔██║██║   ██║██║   ██║██║   ██║██╔████╔██║
██║╚██╔╝██║██║   ██║██║   ██║██║   ██║██║╚██╔╝██║
██║ ╚═╝ ██║╚██████╔╝╚██████╔╝╚██████╔╝██║ ╚═╝ ██║
╚═╝     ╚═╝ ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝     ╚═╝
-------------------------------------------------
              `date "+%Y-%m-%d %H:%M:%S"`
-------------------------------------------------
`echo -e "\033[35m 1)镜像查看-默认\033[0m"`
`echo -e "\033[35m 2)镜像下载-默认\033[0m"`
`echo -e "\033[35m 3)镜像修改-阿里\033[0m"`
`echo -e "\033[35m 4)镜像上传-阿里\033[0m"`
`echo -e "\033[35m 5)镜像下载-阿里\033[0m"`
`echo -e "\033[35m 6)镜像修改-默认\033[0m"`
`echo -e "\033[35m 7)镜像删除-阿里\033[0m"`
`echo -e "\033[35m 8)返回菜单\033[0m"`
`echo -e "\033[35m 9)退出程序\033[0m"`
EOF
read -p "请输入要执行的操作：" num1
case $num1 in
1)
echo "镜像查看-默认"
echo ${images0[@]}
menu
;;
2)
echo "镜像下载-默认"
for imageName in ${images0[@]} ; do docker pull $imageName;done
menu
;;
3)
echo "镜像修改-阿里"
for ((i=0;i<${#images0[@]};i++));do docker tag  ${images0[i]} ${images4[i]};done
menu
;;
4)
echo "镜像上传-阿里"
for imageName in ${images4[@]} ; do docker push $imageName;done
menu
;;
5)
echo "镜像下载-阿里"
for imageName in ${images4[@]} ; do docker pull $imageName;done
menu
;;
6)
echo "镜像修改-阿里"
for ((i=0;i<${#images0[@]};i++));do docker tag  ${images4[i]} ${images0[i]};done
menu
;;
7)
echo "镜像删除-阿里"
docker rmi $(docker images|grep registry|awk '{print $1 ":" $2 }')
menu
8)
clear
menu
;;
9)
exit 0
esac
}
menu
