# mlsql-mllib

[mlsql mllib](https://github.com/allwefantasy/mlsql-plugins/tree/master/mlsql-mllib) 插件将 spark-mllib 包装为 MLSQL ET 使用。

## 如何安装

在 Web 控制台中执行以下命令：

```
!plugin app add "tech.mlsql.plugins.mllib.app.MLSQLMllib" "mlsql-mllib-2.4";
```

> 注意：示例中 mlsql 的 spark 版本为 2.4 ，如果需要在 spark 3.X 的版本运行，请将安装的插件设置为 `mlsql-analysis-toolkit-3.0`

检查是否安装成功，可以执行如下宏命令，用于查看ET组件的信息：

```
!show et/ClassificationEvaluator;
!show etc/RegressionEvaluator;
```

## 如何使用

Classification:

```sql
predict data as RandomForest.`/tmp/model` as predicted_table;
run predicted_table as ClassificationEvaluator.``;
```

Regression:

```sql
predict data as LinearRegressionExt.`/tmp/model` as predicted_table;
run predicted_table as RegressionEvaluator.``;
```







