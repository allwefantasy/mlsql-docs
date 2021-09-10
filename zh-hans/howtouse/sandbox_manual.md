# Sandbox 使用指南

Sandbox 包含了 MLSQL Stack 两大组件 Console 和 Engine，您可以快速体验 MLSQL 功能。

## Sandbox 部署

### 安装 Docker Desktop

从 [官网](https://www.docker.com/products/docker-desktop) 下载适配您操作系统的安装包，再安装。

### 部署 Sandbox

使用 docker 命令启动 Spark 2.4.3版 Sandbox 容器

```shell
docker run -d \
--restart=always \
--name sandbox-2.4.3-2.1.0 \
-p 9002:9002 \
-p 9003:9003 \
-e MYSQL_ROOT_PASSWORD=mlsql \
techmlsql/mlsql-sandbox:2.4.3-2.1.0
```
 
使用 docker 命令启动 Spark 3.1.1版 Sandbox 容器

```shell
docker run -d \
--restart=always \
--name sandbox-3.1.1-2.1.0 \
-p 9002:9002 \
-p 9003:9003 \
-e MYSQL_ROOT_PASSWORD=mlsql \
techmlsql/mlsql-sandbox:3.1.1-2.1.0
```

请注意:
- 若启动容器时，拉取镜像超时，
- 您只需启动一个Sandbox 镜像

## 体验 MLSQL 功能

浏览器[登录](http://localhost:9002)，在用户注册界面，输入用户名和密码，在下一界面按下图输入，点击 Go

和 Go to console Page, 进入使用界面。

![注册引擎](images/sandbox-engine-registration.PNG)

### 使用 Python和Ray 处理JSON 数据

请执行代码

```sql
-- 构造测试数据
set mockData='''

{"title":"第一","body":"内容1"}
{"title":"第二","body":"内容2"}
{"title":"第三","body":"内容3"}

''';

load jsonStr.`mockData` as data;

-- 设置Python 环境 
!python env "PYTHON_ENV=:";
!python conf "runIn=driver";
!python conf "schema=st(field(title,string),field(body,string))";
!python conf "dataMode=data";

-- Python 代码在Sandbox内置的Ray上执行
!ray on data '''

import ray
from pyjava.api.mlsql import RayContext
import numpy as np;

ray_context = RayContext.connect(globals(),"localhost:10001")

def echo(row):
    row1 = {}
    row1["title"]="jackm"
    row1["body"]= row["body"]
    return row1

ray_context.foreach(echo)

''' named newdata;

select * from newdata as output;
``` 

结果如下:

![Python-Ray结果](images/python-ray-result.PNG)
 
 ### 处理MySQL 数据
 
 ```sql
-- 加载mlsql_console.mlsql_job 表数据
 load jdbc.`mlsql_job` where url="jdbc:mysql://localhost:3306/mlsql_console?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&tinyInt1isBit=false"
 and driver="com.mysql.jdbc.Driver"
 and user="root"
 and password="mlsql"
 as table1;
 
-- 查询100条
select * from table1 limit 100 as table2;

-- 保存到DeltaLake
save append table2 as delta.`dt1`;

-- 查询 DeltaLake 
load delta.`dt1` as table3;
 
select * from table3 as table4;
 ```

结果如下:
![MySQL-deltalake](images/mysql-deltalake.PNG)