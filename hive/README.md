# Hive

基于[hadoop-single-node](../hadoop-single-node)构建。添加了hive配置。

## 配置

由于Hive是构建在Hadoop之上，所以启动Hive之前，需要先配置好Hadoop。方便测试，使用了单点的[hadoop-single-node](../hadoop-single-node)

构建好Hadoop之后，配置Hive。参考[BasicConfigurationParameters](https://cwiki.apache.org/confluence/display/Hive/AdminManual+MetastoreAdmin#AdminManualMetastoreAdmin-BasicConfigurationParameters)

### 仓库目录
```
<property>
    <name>hive.metastore.warehouse.dir</name>
    <value>/opt/hive-data/hive/warehouse</value>
</property>
```


### 数据库连接配置

```
<property>
    <name>javax.jdo.option.ConnectionDriverName</name>
    <value>com.mysql.jdbc.Driver</value>
</property>
<property>
    <name>javax.jdo.option.ConnectionUserName</name>
    <value>root</value>
</property>
<property>
    <name>javax.jdo.option.ConnectionPassword</name>
    <value>123456</value>
</property>
```

### 数据存储位置
在Hive 0.10时，弃用了`hive.metastore.local`，选择使用了`hive.metastore.uris`。如果是空，则表示`local`

```
<property>
    <name>hive.metastore.uris</name>
    <value/>
</property>
```

## 启动

### 初始化数据库

```
schematool -initSchema -dbType mysql
```
### 连接
直接输入`hive`就可以打开



## 多用户模式
### server
需要在初始化数据库后启动server

```
hive --service metastore
```

### client
需要修改`hive.metastore.uris`位置，server默认端口是9083

```
<property>
    <name>hive.metastore.uris</name>
    <value>thrift://hive-base:9083</value>
</property>
```

## MySQL连接

为了测试，方便使用了非ssl连接`useSSL=false`
