#!/bin/sh

VERSION=usoft-v4.8.23

echo '开始构建Docker镜像...'
docker build -f ./projects/app/Dockerfile -t registry.cn-shanghai.aliyuncs.com/usoftgs/fastgpt:${VERSION} --platform linux/amd64 . --build-arg name=app
echo 'Docker构建镜像完成...'

echo '开始上传镜像...'
docker push registry.cn-shanghai.aliyuncs.com/usoftgs/fastgpt:${VERSION}
echo '上传镜像完成...'

echo '开始清理...'
docker rmi registry.cn-shanghai.aliyuncs.com/usoftgs/fastgpt:${VERSION}
echo '清理完成...'
