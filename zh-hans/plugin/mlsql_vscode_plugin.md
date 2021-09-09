## MLSQL VSCode 插件 mslql-lang-vscode-plugin 使用




> 在Mac/Linux环境中验证测试过,但是在 Windows 环境尚未被验证过，因此建议您仅在 Linux 和 Mac 环境中使用.

### 安装
1. 安装 [Visual Studio Code](https://code.visualstudio.com/)

2. 安装 mlsql-lang VSCode 插件，可以从以下几种方式进行安装
   >参考如下两个地址：
   > * [mlsql-lang-vscode-plugin/github](https://github.com/allwefantasy/mlsql-lang-vscode-plugin)
   > 
   > * [mlsql-lang-vscode-plugin/gitee](https://gitee.com/allwefantasy/mlsql-lang-vscode-plugin)
   
   * **本地安装**：
     * **Step1** 从http://download.mlsql.tech/mlsql-0.0.4.vsix 下载 mlsql-0.0.4.vsix

     * **Step2** 打开 VSCode -> 左侧面板选择拓展 -> 选择从VSIX安装 -> 选择刚下载的 mlsql-0.0.4.vsix 目录进行安装
     ![img.png](images/img.png)

   * **从VSCode插件Market安装**
   
     从VSCode的插件市场里搜索到并安装 （友情提示，此处开VPN加持，Market响应速度会更快）
     ![img_1.png](images/img_1.png)
   
###配置mlsql.config文件
   * **Step 1**
   从 https://mlsql-downloads.kyligence.io/2.1.0/ 下载 mlsql-app_2.4-2.1.0-darwin-amd64.tar.gz，并解压
   
   * **Step 2**
   如图所示，在.mlsql.config里配置两个变量， *java.home*和*engine.home*. _java.home_ 是你本地电脑java的path，
   _engine.home_ 是**Step 1**下载并解压好的带bin的目录（P.S. bin目录无需配置在engin.home里，只需要配置bin所在的目录）
   ![img_2.png](images/img_2.png)
   <br/>

   * **Step 3**
   创建一个.mlsql或者.mlsqlnb后缀的文件，在VSCode里按住shift+command+p，先选择【开发人员：重新加载窗口】确保mlsql.config文件生效。
   然后再选择MLSQL RUN即可编译和执行.mlsql文件
   ![img_3.png](images/img_3.png)
   <br/>

### Examples
可以从 https://github.com/allwefantasy/mlsql-lang-example-project 下载MLSQL VSCode插件的例子项目
在执行之前，可以先执行`./src/common/PyHeader.mlsql`文件进行python env的设置。
* **ExcelExample**
![img.png](images/img202109091351.png)
* **IfElseExample**
![img_1.png](images/img_202109091352.png)
* **SimpleMLExample**
![img_2.png](images/img_202109091353.png)
* **PythonScriptExample**
![img_3.png](images/img_202109091354.png)
* **PublicModuleIncludeExample**
![img_4.png](images/img_4.png)