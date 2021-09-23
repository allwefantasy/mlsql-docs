# Excel 数据源插件

[mlsql-excel](https://github.com/allwefantasy/mlsql-plugins/tree/master/mlsql-excel) 插件用于加载 Excel 数据源。

## 如何安装

```
!plugin ds add - "mlsql-excel-2.4";
```

> 注意：示例中 mlsql 的 spark 版本为 2.4 ，如果需要在 spark 3.X 的版本运行，请将安装的插件设置为 `mlsql-excel-3.0`

## 如何使用

```sql
load excel.`/tmp/upload/example_en.xlsx` 
where useHeader="true" 
and maxRowsInMemory="100" 
and dataAddress="A1:C8"
as data;

select * from data as output;
```

参数介绍：

| 参数名  |  参数含义 |
|---|---|
| useHeader | 是否有表头 |
| maxRowsInMemory | 控制内存 |
| dataAddress | Excel表里的起始和结束位置。分别为最左上角和最右下角。 |