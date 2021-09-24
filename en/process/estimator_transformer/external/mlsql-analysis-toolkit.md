# MLSQL 常用工具包插件

[MLSQL 常用工具包](https://github.com/allwefantasy/mlsql-plugins/tree/master/mlsql-analysis-toolkit) 提供了一些的数据分析常用工具，方便用户快速处理数据。

## 如何安装

```
!plugin app add - "mlsql-analysis-toolkit-2.4";
```

> 注意：示例中 mlsql 的 spark 版本为 2.4 ，如果需要在 spark 3.X 的版本运行，请将安装的插件设置为 `mlsql-analysis-toolkit-3.0`


## 如何使用

1. 计算表中的字段中数：

```sql
!approxQuantile time_temp birthday "0.5" valued time_quantile;
select ${time_quantile} as quantile as output;
```


2. 创建具有固定大小的 id 列的表：

 ```sql
!dataframe build range 100000 named table1;
```



