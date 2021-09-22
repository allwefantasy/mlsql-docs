# 流程序持久化

该插件用于持久化流程序。当系统重启后，会自动启动之前启动过的流。

## 如何安装

> 如果MLSQL Meta Store 采用了MySQL存储，那么你需要使用 https://github.com/allwefantasy/mlsql-plugins/blob/master/stream-persist/db.sql
> 中的表创建到该MySQL存储中。

完成如上操作之后，安装插件：

```
!plugin app add - "stream-persist-app-2.4";
```

> 注意：示例中 mlsql 的 spark 版本为 2.4 ，如果需要在 spark 3.X 的版本运行，请将安装的插件设置为 `stream-persist-app-3.0`


## 如何使用

```sql
!streamPersist persist streamExample;

!streamPersist remove streamExample;

!streamPersist list;
```

指定的流程序会被保留下来。当系统重启后，会重新执行。

## 项目地址

[stream-persist](https://github.com/allwefantasy/mlsql-plugins/tree/master/stream-persist)