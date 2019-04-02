# dockercomposes

整理一些自己常用的docker镜像


## 容器时间设置
设置容器的时间和主机的时间相同
```bash
ln -s /etc/localtime /data/k8s-volume/common/conf/localtime

ln -s /etc/timezone /data/k8s-volume/common/conf/timezone
```


# 加速器

由于网络原因，在pull官方镜像的时候速度较慢，推荐两个国内的加速器。都还好，相互替补吧

- [aliyun.com](https://www.aliyun.com/) 找 R容器服务

    或者参考云栖社区的文章：[Docker镜像加速器](https://yq.aliyun.com/articles/29941)

- [daocloud.io](https://www.daocloud.io/mirror#accelerator-doc)
