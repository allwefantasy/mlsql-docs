# HBase 数据源

HBase 是一个应用很广泛的存储系统。MLSQL 也支持将其中的某个索引加载为表。

注意，HBase 的包并没有包含在 MLSQL 默认发行包里，所以你需要通过 --jars 带上相关的依赖才能使用。用户有三种种方式获得
HBase Jar包(推荐第一种)：

1. 直接使用 [hbase Datasource 插件](https://github.com/allwefantasy/mlsql-pluins/tree/master/ds-hbase-2x) ；

2. 访问 [spark-hbase](https://github.com/allwefantasy/spark-hbase) ,然后手动进行编译；

##  如何使用

### 插件安装

通过如下指令安装 `ds-hbase-2x` ：

```sql
!plugin ds add tech.mlsql.plugins.ds.MLSQLHBase2x ds-hbase-2x;
```                                                           

因为HBase依赖很多，大概80多M,下载会比较慢。

### 在 MLSQL 中执行

MLSQL 脚本如下:

```sql
set rawText='''
{"id":9,"content":"Spark","label":0.0}
{"id":10,"content":"MLSQL","label":0.0}
{"id":12,"content":"MLSQL lang","label":0.0}
''';

load jsonStr.`rawText` as orginal_text_corpus;

select cast(id as String)  as rowkey,content,label from orginal_text_corpus as orginal_text_corpus1;

-- connect 后面接数据格式，这里是 hbase2x, 然后后面接一些配置。最后将这个连接命名为 hbase1. 
connect hbase2x where `zk`="127.0.0.1:2181"
and `family`="cf" as hbase1;

save overwrite orginal_text_corpus1 
as hbase2x.`hbase1:mlsql_example`;

load hbase2x.`hbase1:mlsql_example` where field.type.label="DoubleType"
as mlsql_example;

select * from mlsql_example as show_data;

```

DataFrame 代码:

```scala
val data = (0 to 255).map { i =>
      HBaseRecord(i, "extra")
    }
val tableName = "t1"
val familyName = "c1"


import spark.implicits._
sc.parallelize(data).toDF.write
  .options(Map(
    "outputTableName" -> cat,
    "family" -> family
  ) ++ options)
  .format("org.apache.spark.sql.execution.datasources.hbase2x")
  .save()
  
val df = spark.read.format("org.apache.spark.sql.execution.datasources.hbase2x").options(
  Map(
    "inputTableName" -> tableName,
    "family" -> familyName,
    "field.type.col1" -> "BooleanType",
    "field.type.col2" -> "DoubleType",
    "field.type.col3" -> "FloatType",
    "field.type.col4" -> "IntegerType",
    "field.type.col5" -> "LongType",
    "field.type.col6" -> "ShortType",
    "field.type.col7" -> "StringType",
    "field.type.col8" -> "ByteType"
  )
).load() 
```         

## ds-hbase-2x 的配置参数

| 参数名  |  参数含义 |
|---|---|
| tsSuffix | 覆盖 Hbase 值的时间戳 |
|namespace|Hbase namespace|
| family |Hbase family，`family=""` 表示加载所有存在的 family |
| field.type.ck | 为 `ck(field name)` 指定类型，现在支持：LongType、FloatType、DoubleType、IntegerType、BooleanType、BinaryType、TimestampType、DateType，默认为: StringType |