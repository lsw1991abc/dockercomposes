# hbase-hdfs

为便于测试使用，Hadoop使用了单机模式。参考[hadoop-single-node](../hadoop-single-node)。

如需使用完全分布式，修改[hbase-site.xml](./hbase-1.3.1/conf/hbase-site.xml)中的`hbase.rootdir`


## 关于regionservers的说明
在compose中，使用了domainname和hostname，所以在regionsevers配置中需要使用 `hostname.domainname`。例如

```
domainname: xbug-network
hostname: hbase-regionserver01
```
在regionsevers中需要写成`hbase-regionserver01.xbug-network`
