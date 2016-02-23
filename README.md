# What is BJTUThesis?

BJTUThesis is an *unofficial* XeLaTeX template for preparing bachelor, master, or doctor thesis in Beijing JiaoTong University. Forked from [weijianwen/SJTUThesis](https://github.com/weijianwen/SJTUThesis) with some small tweaks.

# 北京交通大学学位论文模板


这是为撰写北京交通大学学士、硕士或博士论文而准备的 XeLaTeX 模板，非官方出品。生成的学位论文文件参见 [Demo](https://github.com/EiddleChen/BJTUThesis/raw/master/thesis.pdf)，欢迎大家分享使用经验。

## 如何使用

BJTUThesis可以在本地编译，也可以在线编译。

### 本地编译 - 系统需求

#### TeX 发行版

BJTUThesis 需要使用 XeTeX 引擎编译。2014和2015年的 [TeXLive](https://www.tug.org/texlive/) 和 [MacTeX](https://www.tug.org/mactex/) 发行版都能编译此模板。**Windows用户**推荐使用 [Babun](http://babun.github.io/) 作为命令行终端。Babun 已默认安装有这些工具：git(版本控制)、GNUmake(编译控制)、perl(字数统计)。

#### 字体

中英文分别依赖 Adobe 的四套简体中文字体和 TeX Gyre Termes 西文字体。Tex Gyre Termes 可从 [CTAN](http://www.ctan.org/tex-archive/fonts/tex-gyre/fonts/opentype/public/tex-gyre) 下载四种不同字型。出于版权考虑，需要大家自行解决 AdobeSongStd, AdobeKaitiStd, AdobeHeitiStd L, AdobeFangsongStd 四款中文字体的授权问题，可以在[这里](https://cs.fit.edu/code/projects/ndworld/repository/revisions/12/show/Resources/Fonts)下载。

#### 安装镜像下载

可以从交大镜像站上找到[CTAN镜像](http://mirror.bjtu.edu.cn/CTAN/systems/texlive/Images/)，也可以使用中科大镜像站提供的[安装包](http://mirrors.ustc.edu.cn/CTAN/systems/texlive/Images/texlive2015-20150523.iso)

* 推荐使用[便携安装](https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#tlportable), 可以随时切换Texlive版本

##### Linux
```
# 安装perl-tk以便启动可视化安装界面：
sudo apt-get install perl-tk

# 挂载安装镜像到/mnt目录:
sudo mount -t  iso9660 -o loop texlive*.iso /mnt/

# 进入/mnt目录并启动安装程序
cd /mnt
perl install-tl -gui -portable
```

##### Windows
```
install-tl-windows.bat -portable
```
##### 添加环境变量
查看目标安装目录`bin`下面的文件夹添加到$PATH, 例如:
```
# Linux x64
~/texlive2015/bin/x86_64-linux

# Windows
C:\texlive\bin\win32
```

#### 终端中克隆最新版

    cd
    git clone https://github.com/eiddlechen/BJTUThesis.git

如果之前有克隆过此模板但是想与 GitHub 上的最新版本同步，以`master`分支为例，执行以下命令更新到最新版。

    git pull origin master

若是自己 fork 后克隆下来的，则执行以下命令。
```
git pull upstream master
```

### 编译模板

编译模板，生成学位论文PDF文件。GNUMake将调用`latexmk`程序，自动完成模板的多轮编译。

    make pvc

定稿后可使用以下命令生成最终版本。

    make clean thesis.pdf

若需要生成用于提交盲审的论文(隐去作者、导师等信息)，可在`thesis.tex`中为`bjtuthesis`文档类添加`review`选项。 若需要生成包含“独创性声明扫描件”和“授权书”签名扫描件的学位论文，请将扫描件分别保存为`pdf/origignal.pdf`和`pdf/authorization.pdf`，然后添加`submit`选项重新编译模板。

#### Windows用户编译

双击`compile.bat`即可完成编译过程，生成`thesis.pdf`，不依赖于 GNUMake。

### 字数统计

    make wordcount

### 问题诊断

编译失败时，可以尝试手动逐次编译。
结合文档 [README.pdf][README] 中的说明，有助于定位故障。

    xelatex -no-pdf thesis
    biber --debug thesis
    xelatex thesis
    xelatex thesis

## 软件许可证

北京交通大学校徽图片(`bjtulog.png`)和横幅图片(`bjtubanner.png`)的版权归原作者所有。其他部分使用 [Apache License 2.0](LICENSE) 授权。

