# Verdaccio

- 官方配置

```shell
docker-compose -f docker-compose-verdaccio.yml up -d
```

- 附带ldap登录插件

参考 [https://www.npmjs.com/package/verdaccio-ldap](https://www.npmjs.com/package/verdaccio-ldap)

```shell
docker-compose -f docker-compose-verdaccio-ldap.yml up -d
```

