# 深度学习

【文档更新日志：2020-04-07】

> Note: 本文档适用于MLSQL Engine 1.6.0-SNAPSHOT/1.6.0 及以上版本。  
> 对应的Spark版本应该为2.4.5,不低于2.4.3。

MLSQL除了可以集成Tensorflow等具备Python接口的框架以外，也提供了一个深度学习算法框架BigDL的插件。  
使用该框架，你无需任何配置即可使用。

在使用前，你需要安装该插件：

```
!plugin app add - "mlsql-bigdl-2.4";
```
除此之外，你还需要在启动Engine时，设置如下参数：

```
-streaming.bigdl.enable true
```

然后就可以使用BigDL的所有功能了。核心功能我们会在后续的章节介绍：

1. 如何加载和处理你的图片
2. 如何创建模型并且进行训练，然后预测