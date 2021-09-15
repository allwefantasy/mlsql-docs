# AutoML

AutoML 是将机器学习应用于现实问题的端到端流程自动化的过程。本次发布的AutoML将插件集市的分类算法进行遍历训练的功能，包含NaiveBayes, LogisticRegression, LinearRegression,
RandomForest以及GBT分类算法。AutoML插件会对用户的输入数据进行多模型训练，然后针对模型表现指标， 进行模型排序，给用户返回表现最优的算法模型。

```sql
-- create test data
set jsonStr='''
{"features":[5.1,3.5,1.4,0.2],"label":0.0},
{"features":[5.1,3.5,1.4,0.2],"label":1.0}
{"features":[5.1,3.5,1.4,0.2],"label":0.0}
{"features":[4.4,2.9,1.4,0.2],"label":0.0}
{"features":[5.1,3.5,1.4,0.2],"label":1.0}
{"features":[5.1,3.5,1.4,0.2],"label":0.0}
{"features":[5.1,3.5,1.4,0.2],"label":0.0}
{"features":[4.7,3.2,1.3,0.2],"label":1.0}
{"features":[5.1,3.5,1.4,0.2],"label":0.0}
{"features":[5.1,3.5,1.4,0.2],"label":0.0}
''';

load jsonStr.`jsonStr` as data;

select vec_dense(features) as features ,label as label from data
as data1;

train data1 as AutoML.`/tmp/auto_ml` where

algos="LogisticRegression,NaiveBayes" 

and sortedBy='f1'

-- once set true,every time you run this script, MLSQL will generate new directory for you model

and keepVersion="true" 

-- specicy the test dataset which will be used to feed evaluator to generate some metrics e.g. F1, Accurate

and evaluateTable="data1"

```

最后输出结果如下：

```
name   value
---------------------------------
modelPath    /_model_1/model/0
algIndex     0
alg          org.apache.spark.ml.classification.LogisticRegression
metrics      f1: 0.7625000000000001 weightedPrecision: 0.8444444444444446 weightedRecall: 0.7999999999999999 accuracy: 0.8
status       success
startTime    20210915 06:11:54:049
endTime      20210915 07:11:03:136
trainParams  Map()
---------------------------------
modelPath    /_model_1/model/0
algIndex     0
alg          org.apache.spark.ml.classification.NaiveBayes
metrics      f1: 0.5764705882352941 weightedPrecision: 0.48999999999999994 weightedRecall: 0.7 accuracy: 0.7
status       success
startTime    20210915 06:11:54:049
endTime      20210915 07:11:03:136
trainParams  Map()
```

AutoML支持如下几个特性：

1. 可以通过 keepVersion 来设置是否保留版本。
2. AutoML 支持在用户指定的算法集合里进行模型训练，用户通过配置 algos 参数（目前支持 " GBTs, LinearRegression, LogisticRegression, NaiveBayes,
   RandomForest " 的子集），让数据集在指定的算法集合中进行训练，获取最优模型
3. AutoML 会根据算法的表现排序，默认是按照 accuracy，用户可以指定按照 f1 或者其他的 metrics 进行排序。
4. AutoML 预测的时候，会根据历史训练的所有模型中挑选出表现最好的模型进行打分预测，用户无需指定特定模型。

## 批量预测

```
predict data1 as AutoML.`/tmp/auto_ml`;
```

结果如下：

```
features                                label  rawPrediction                                            probability  prediction
{"type":1,"values":[5.1,3.5,1.4,0.2]}	0	{"type":1,"values":[16.28594461094461,3.7140553890553893]}	{"type":1,"values":[0.8142972305472306,0.18570276945276948]}	0
{"type":1,"values":[5.1,3.5,1.4,0.2]}	1	{"type":1,"values":[16.28594461094461,3.7140553890553893]}	{"type":1,"values":[0.8142972305472306,0.18570276945276948]}	0
```
