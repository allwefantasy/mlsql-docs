# Introduction into JSON Expansion
As an engineer/analyst, it's common practice to process JSON. Like Hive and Spark,
MLSQL comes with JSON expansion functionality.

### JSON Expansion Examples
- Find the Manual
```shell script
load modelExample.`JsonExpandExt` AS output;
```
- Example 1：non-nested JSON 
```shell script
SELECT '{"name":"Michael"}' AS col_1
UNION ALL
SELECT '{"name":"Andy", "age":30}' AS col_1 AS table_1;

run table_1 as JsonExpandExt.`` where inputCol="col_1" AND samplingRatio = "1.0" as table_2;
```
Result

|name | age| 
|---|---|
|Michael | |
|Andy |30|

Parameter inputCol is required, its values indicates the JSON column. samplingRatio="1.0" 
means the system would process whole data set while inferring JSON schema.

- Example 2：nested JSON
```shell script
SELECT '{"name":"Michael", "address":{"city":"hangzhou", "district":"xihu"} } ' AS col_1 AS table_1;
run table_1 as JsonExpandExt.`` where inputCol="col_1" AND samplingRatio = "1.0" as table_2;
run table_2 AS JsonExpandExt.`` WHERE inputCol="address" AS table_3;
```
Result

|name|city|district|
|---|---|---|
|Michael|hangzhou|xihu|
Please note, two run commands are required to extract the nested attributes - city and district.

### Quick Start
Please run the [Docker image](https://github.com/allwefantasy/mlsql-build#running-sandbox).
Enter  http://127.0.0.1:9003 in the browser, and run aforementioned code.

### Feedback
Should you have any questions, please submit an issue in https://github.com/allwefantasy/mlsql
