# 控制台输出 SQL 内容

[控制台输出 SQL 内容](https://github.com/allwefantasy/mlsql-plugins/tree/master/echo-controller)  插件用于返回控制台请求的 sql 内容。比如有些场景，我们只需要验证从 MLSQL Console 到 Engine 的通路，不需要 sql 真正去执行，可以使用该插件提供的 `echo` Mode。

##  如何安装

使用plugin 命令安装 `echo-controller` App：

```sql
!plugin app add - echo-controller-2.4;
```

> 注意：示例中 mlsql 的 spark 版本为 2.4 ，如果需要在 spark 3.X 的版本运行，请将安装的插件设置为 `echo-controller-3.0`

##  如何使用

主动请求 `/run/script` ，并设置 `executeMode` 为 **echo** ：

```
select crawler_http("http://127.0.0.1:9003/run/script","POST",map("owner","wow","sql","select 1 as a as output;","executeMode","echo")) as c as output;
``` 

服务器将响应 `select 1 as a as output;` 返回而不是执行 sql。