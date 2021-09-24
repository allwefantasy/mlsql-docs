# Connect语句持久化

[connect-persist](https://github.com/allwefantasy/mlsql-plugins/tree/master/connect-persist) 用于持久化connect语句。当系统重启后，无需再执行connect语句。

## 如何安装

> 如果MLSQL Meta Store 采用了MySQL存储，那么你需要使用 https://github.com/allwefantasy/mlsql-plugins/blob/master/connect-persist/db.sql
> 中的表创建到该MySQL存储中。

完成如上操作之后，安装插件：

```
!plugin app add - 'connect-persist-app-2.4';
```

> 注意：示例中 mlsql 的 spark 版本为 2.4 ，如果需要在 spark 3.X 的版本运行，请将安装的插件设置为 `connect-persist-app-3.0`


## 如何使用

```sql
!connectPersist;
```

所有执行过的connect语句都会被保留下来。当系统重启后，会重新执行。