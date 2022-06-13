
#!/bin/bash
# author:岩 
# message: 对容器执行部署或者升级

echo "服务：$1"
echo "版本: $2"
echo "部署文件: $3"
echo "命名空间: $4"

get_deploy=`kubectl get deployments $1 -n $4 2>&1 |grep -v NotFound |grep $1 | wc -l`
if [ $get_deploy -gt 0 ];then
echo "更新镜像"
 kubectl set image deployment/$1  $1=a121984376/$1:$2 -n $4
else

echo "部署镜像"
 kubectl apply -f $3

fi
