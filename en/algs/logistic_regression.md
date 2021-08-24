# Logistic Regression

Logistic Regression is used to model the probability of a certain class or event existing such as pass/fail, win/lose, alive/dead or healthy/sick。

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
select vec_dense(features) as features , label as label from data
as data1;

-- select * from data1 as output1;
-- -- use LogisticRegression
train data1 as LogisticRegression.`/tmp/model_2` where

-- -- once set true,every time you run this script, MLSQL will generate new directory for you model
keepVersion="true" 

-- specicy the test dataset which will be used to feed evaluator to generate some metrics e.g. F1, Accurate
and evaluateTable="data1"

-- specify group 0 parameters
and `fitParam.0.labelCol`="label"
and `fitParam.0.featuresCol`="features"
and `fitParam.0.fitIntercept`="true"

-- specify group 1 parameters
and `fitParam.1.featuresCol`="features"
and `fitParam.1.labelCol`="label"
and `fitParam.1.fitIntercept`="false"
;
```

The output are shown below：

```
name   value
---------------	------------------
modelPath	/_model_5/model/1
algIndex	1
alg	        org.apache.spark.ml.classification.LogisticRegression
metrics	    f1: 0.7625000000000001 weightedPrecision: 0.8444444444444446 weightedRecall: 0.7999999999999999 accuracy: 0.8
status	    success
message	
startTime	20210824 42:14:33:761
endTime	    20210824 42:14:41:984
trainParams	Map(labelCol -> label, featuresCol -> features, fitIntercept -> false)
---------------	------------------
modelPath	/_model_5/model/0
algIndex	0
alg	        org.apache.spark.ml.classification.LogisticRegression
metrics	    f1: 0.7625000000000001 weightedPrecision: 0.8444444444444446 weightedRecall: 0.7999999999999999 accuracy: 0.8
status	    success
message	
startTime	20210824 42:14:41:985
endTime	    20210824 42:14:47:830
trainParams	Map(featuresCol -> features, labelCol -> label, fitIntercept -> true)
```

Linear Regression support the following features:
1. Use keepVersion to remain multiple versions of models.
2. use fitParam.number to config multiple groups of params, and automatically calculate metrics after setting evaluateTable



## Batch Prediction

```
predict data1 as LogisticRegression.`/tmp/model_2`;
```

The result are shown below：

```
features	                            label	        rawPrediction	                                    probability	                                                    prediction
{"type":1,"values":[5.1,3.5,1.4,0.2]}	0	{"type":1,"values":[1.0986123051777668,-1.0986123051777668]}	{"type":1,"values":[0.7500000030955607,0.24999999690443933]}	0
{"type":1,"values":[5.1,3.5,1.4,0.2]}	1	{"type":1,"values":[1.0986123051777668,-1.0986123051777668]}	{"type":1,"values":[0.7500000030955607,0.24999999690443933]}	0
```

## API Prediction


```sql
register LogisticRegression.`/tmp/model_2` as lr_predict;

-- you can specify which module you want to use:
register LogisticRegression.`/tmp/model_2` as lr_predict where
algIndex="0";

-- you can specify which metric the MLSQL should use to get best model
register LogisticRegression.`/tmp/model_2` as lr_predict where
autoSelectByMetric="f1";

select lr_predict(features) as predict_label, label from data1 as output;
```

algIndex allows us to choose a specific model for registering. We can also apply the automatically selection after configuring the parameter of evalateTable before training, which can be done by using autoSelectByMetric.

Then, you can use the prediction as a function with features.
