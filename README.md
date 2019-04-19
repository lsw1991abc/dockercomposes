# docker-composes

整理一些自己常用的docker镜像

## Swarm

初始化
```bash
docker swarm init
```

可配置的参数可以使用`--help`查看

初始化后，会有以下提示
> Swarm initialized: current node (xxxxxx) is now a manager.
> 
>  To add a worker to this swarm, run the following command:
> 
>     docker swarm join --token SWMTKN-xxxxx <IP>:2377
> 
> To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.


## Portainer

参考链接：[https://www.portainer.io/installation/](https://www.portainer.io/installation/)

方式有两种，代理和非代理

> Note that the recommended deployment mode when using Swarm is using the Portainer Agent.

- 非代理
  ```bash
  docker volume create portainer_data
  docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
  ```
  
- 代理

  推荐使用，可以使用Swarm的特性，并且支持的`docker-compose`的版本更高
  ```bash
  curl -L https://downloads.portainer.io/portainer-agent-stack.yml -o portainer-agent-stack.yml
  docker stack deploy --compose-file=portainer-agent-stack.yml portainer
  ```
  
## Network

`Portainer`的运行，会创建自己用的几个network

```bash
docker network ls
```

如果想使用自定义的，也可以自己创建。使用`docker-compose`时，对`scope`有校验，所以要加`--scope=swarm`

```bash
docker network create --scope=swarm --driver=overlay --attachable mobe-network
```
  
## 容器时间设置

设置容器的时间和主机的时间相同，启动时挂载到容器内

```bash
ln -s /etc/localtime /data/k8s-volume/common/timezone/localtime

ln -s /etc/timezone /data/k8s-volume/common/timezone/timezone
```

# 加速器

由于网络原因，在pull官方镜像的时候速度较慢，推荐两个国内的加速器。都还好，相互替补吧

- [aliyun.com](https://www.aliyun.com/) 找 R容器服务

    或者参考云栖社区的文章：[Docker镜像加速器](https://yq.aliyun.com/articles/29941)

- [daocloud.io](https://www.daocloud.io/mirror#accelerator-doc)
