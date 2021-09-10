## MLSQL 桌面版使用 (Mac/Linux)

### 前置条件
1. 安装 [Visual Studio Code](https://code.visualstudio.com/)


> 在Mac/Linux环境中验证测试过,但是在 Windows 环境尚未被验证过，因此建议您仅在 Linux 和 Mac 环境中使用.

### 安装步骤

mlsql-lang VSCode 插件有两种安装方式，包含本地安装和从插件市场安装。具体步骤如下：

- 本地安装

    1. 从 [MLSQL 下载站点](http://mlsql-download.kyligence.io/2.1.0/) 下载 mlsql-0.0.4.vsix 文件

    2. 打开 VSCode -> 左侧面板选择`拓展` -> 选择 `从 VSIX 安装` -> 选择刚下载的 mlsql-0.0.4.vsix 目录进行安装

       ![img.png](images/img_local_install.png)

- 从 VSCode 插件 Market 安装

    1. 从 VSCode 的插件市场里搜索 `MLSQL` 并安装此插件 （友情提示，此处开VPN加持，Market响应速度会更快）

       > 友情提示: 使用 VPN 能加快 Market 的响应速度

       ![img_1.png](images/img_looup_mlsql.png)

> 请注意:
> 1. 请使用 mslql-lang-vscode-plugin 0.0.4 及以上版本
> 2. Windows 环境版本还未被验证过，因此建议您在 Linux 和 Mac 的环境下使用
> 3. 插件源码参考 [mlsql-lang-vscode-plugin/github](https://github.com/allwefantasy/mlsql-lang-vscode-plugin)
   
###配置mlsql.config文件

1. 从 [此处](https://mlsql-downloads.kyligence.io/2.1.0/) 下载 mlsql-app_2.4-2.1.0-darwin-amd64.tar.gz，并解压

2. 根据下方图片，在.mlsql.config里配置两个变量，*java.home* 和 *engine.home*

   > java.home 为本机 java 的安装目录，engine.home 为步骤1 中下载文件的解压目录（P.S. bin目录无需配置在 engin.home 里，只需要配置 bin 所在的目录）

   ![img_2.png](images/img_cinfig_params.png)

3. 创建一个.mlsql 或者 .mlsqlnb 后缀的文件，在 VSCode 里按住 `shift+command+p`，先选择【开发人员：重新加载窗口】确保 mlsql.config 文件生效，
   然后再选择 MLSQL RUN 即可编译和执行.mlsql文件

   ![img_3.png](images/img_reload_window.png)

### 示例
您可以从 [此处](https://github.com/allwefantasy/mlsql-lang-example-project) 下载 MLSQL VSCode 插件的样例项目
在执行之前，可以先执行 `./src/common/PyHeader.mlsql` 文件进行 python env 的设置。
1. **ExcelExample**

    ![img.png](images/img_eg_execl.png)

2. **IfElseExample**

    ![img_1.png](images/img_eg_ifelse.png)

3. **SimpleMLExample**

    ![img_2.png](images/img_eg_mlsqlnb.png)

4. **PythonScriptExample**

    ![img_3.png](images/img_eg_pyscript.png)

5. **PublicModuleIncludeExample**

    ![img_4.png](images/img_eg_module_include.png)