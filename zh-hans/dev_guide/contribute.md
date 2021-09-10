## 如何贡献 MLSQL 代码

本文记录了对 MLSQL 进行代码贡献的最佳方式，包括提交代码前所需要检查的内容。

### 评估是否需要更改

1. 当使用 MLSQL 遇到问题时，可以先查找 MLSQL 文档和 github issue，也许这个问题已经被提出过。

2. 确认代码是否必须更改，当查阅 MLSQL 文档中无法解决问题时，请在 MLSQL 社区，交流群里提出问题进行讨论，也许他们能给你建议。

3. 当确认是一个问题后，请在 github 中新建一个 issue，并加以描述。

### 提交 PR 检查事项

1. 保证该变更已被充分测试，语法层面的错误需要新增自动化测试用例

   详细请看 [MLSQL 自动化测试](engine/it/integration_test.md)

2. 检查是否需要变更文档，变更提交到以下项目

   [MLSQL 文档项目](https://github.com/allwefantasy/mlsql-docs)
   
### 联系 Reviewer 审阅 PR

1. MLSQL Reviewer 目前有以下三位

   allwefantasy, lwz9103, chncaesar
   
2. 解决所有要求的变更。当 Reviewer 提出更改建议后，请对所有的建议加以讨论并解决。


