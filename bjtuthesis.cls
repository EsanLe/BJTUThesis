%# -*- coding: utf-8-unix -*-
%==================================================
%% bjtuthesis.cls for BJTU Master Thesis
%%==================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{bjtuthesis}[2015/3/15 v0.9 Beijing Jiaotong University Template]
\def\version{v0.9}
\newif\ifbjtu@bachelor\bjtu@bachelorfalse
\newif\ifbjtu@master\bjtu@masterfalse
\newif\ifbjtu@doctor\bjtu@doctorfalse
\newif\ifbjtu@review\bjtu@reviewfalse
\newif\ifbjtu@submit\bjtu@submitfalse
\newif\ifbjtu@professional\bjtu@professionalfalse
\DeclareOption{bachelor}{\bjtu@bachelortrue}
\DeclareOption{master}{\bjtu@mastertrue}
\DeclareOption{doctor}{\bjtu@doctortrue}
\DeclareOption{review}{\bjtu@reviewtrue}
\DeclareOption{submit}{\bjtu@submittrue}
\DeclareOption{professional}{\bjtu@professionaltrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[a4paper,UTF8,scheme=chinese]{ctexbook}
\ifbjtu@bachelor\relax\else
  \ifbjtu@master\relax\else
    \ifbjtu@doctor\relax\else
      \ClassError{bjtuthesis}%
      		{You have to specify one of thesis options: bachelor, master or doctor.}{}
    \fi
  \fi
\fi

%% bjtuthesis.cls segments
% 0. Import bjtuthesis.cfg
% 1. Import and configure LaTeX packages.
% 2. Define general-purpose LaTeX commands. 
% 3. Configure the imported packages, also extend LaTeX command in bjtuthesis
% 4. Draw the bjtuthesis

%==========
% Segment 0. Import bjtuthesis.cfg 
%==========

%% 导入 bjtuthesis.cfg 文件
\AtEndOfClass{\input{bjtuthesis.cfg}}


%==========
% Segment 1. Import LaTeX packages.
%==========

% tmargin = 16mm + 5mm = 21mm, bottom= 30mm + 1em(4mm), footskip = bottom - 15mm - 1em(4mm)
\RequirePackage[centering,a4paper,top=30mm,bottom=34mm,left=35mm,right=25mm,tmargin=21mm,footskip=11mm]{geometry} %设置版面

\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{fontspec}
\RequirePackage{metalogo,doc}
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm,mathrsfs} 
\RequirePackage{upgreek}
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{ccaption}
\RequirePackage[backend=biber, style=caspervector,utf8, bibencoding=utf8, sorting=none]{biblatex}
\RequirePackage{xcolor}
\RequirePackage{wasysym}
\RequirePackage{listings}
\RequirePackage[xetex, bookmarksnumbered, colorlinks, urlcolor=black, linkcolor=black, citecolor=black, plainpages=false, pdfstartview=FitH]{hyperref}
\RequirePackage{longtable}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage[inline]{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{calc}
\RequirePackage{algorithm, algorithmic}
\RequirePackage{siunitx}
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows}
\RequirePackage{longtable}

%==========
% Segment 2. Define general-purpose LaTeX commands.
%==========

\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)
    
% User defined command list
%% \me \mi \mj \dif \cleardoublepage \cndash \CJKLaTeX

% A new column type
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

% upper math letter
\newcommand{\me}{\mathrm{e}} 
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\mathrm{d}}

\def\cleardoublepage{\clearpage%
	\if@openright%
	  \ifodd
	    \c@page%
	  \else%
  	    \thispagestyle{empty}%
  	    \hbox{}%
	    \newpage%
	  \fi%
	\fi}

% CJK-LaTeX Logo \CJKLaTeX
\newcommand{\CJKLaTeX}{CJK--\LaTeX} 

% cndash
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

%==========
% Segment 3. Configure the imported packages, also extend LaTeX command in bjtuthesis
%==========

% Set the mainfont
\setmainfont{TeX Gyre Termes}
\setCJKmainfont[BoldFont=SimHei,ItalicFont=SimSun]{SimSun} % 强行指定斜体和粗体

%% 行距缩放因子
\linespread{1.3}

%% CTeX Settings
% 名称：目录、表格索引、插图索引、算法、算法索引、代码
\ctexset{contentsname={\bjtu@contentsname}}
\ctexset{listfigurename={\bjtu@listfigurename}}
%\ctexset{listtablename={\bjtu@listtablename}}
\floatname{algorithm}{\bjtu@label@algo}
\renewcommand{\listalgorithmname}{\bjtu@listalgorithmname}
\renewcommand{\lstlistingname}{\bjtu@value@listingname}
% Title Settings at the chapter Level
\ctexset{chapter={
  name={,},
  number={\arabic{chapter}},
  nameformat={\zihao{3}\bfseries},
  titleformat={\zihao{3}\bfseries},
	beforeskip={15\p@},
	afterskip={12\p@},
	}
}

\newcommand*\listoffiguresandtables{%
  \chapter*{\listfigureandtablename}% 如果是 article 文档类，把 \chapter 换成 \section
  \@mkboth{\MakeUppercase\listfigureandtablename}%
          {\MakeUppercase\listfigureandtablename}%

  \@starttoc{lof}%% 插图目录
  %\bigskip       %% 目录间的距离，不需要的话可以删掉或者换其他内容
  \@starttoc{lot}%% 表格目录
}

\newcommand*\listfigureandtablename{索引}

% Title Settings at the section Level
\ctexset{section={
	format={\zihao{-3}\bfseries},
	afterskip={1.0ex \@plus .2ex},
	}
}
% Title Settings at the subection Level
\ctexset{subsection={
  format={\zihao{4}\bfseries},
	indent={0\ccwd},
	afterskip={1.0ex \@plus .2ex},
	}
}
% Title Settings at the subsubection Level
\ctexset{subsubsection={
	format={\normalfont\normalsize},
	indent={0\ccwd},
	afterskip={1.0ex \@plus .2ex},
	}
}

% bullets in the item
\renewcommand{\labelitemi}{\ensuremath{\bullet}}

%% Graphic path & file extension
\graphicspath{{fig/}{figure/}{figures/}{logo/}{logos/}{graph/}{graphs}}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

% Caption setting in ccaption pacakge
\captiondelim{\ }
\captionnamefont{\songti\small}
\captiontitlefont{\songti\small}

% Floating parameters
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 定公式、图、表、算法的编号为"3-1"的形式，即分隔符由.变为短杠
\renewcommand{\theequation}{\arabic{chapter}--\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}--\arabic{figure}}
\renewcommand\p@subfigure{\thefigure}
\renewcommand{\thetable}{\arabic{chapter}--\arabic{table}}
\renewcommand{\thealgorithm}{\arabic{chapter}--\arabic{algorithm}}

% 列表右缩进
\setlist[description]{leftmargin=\parindent,labelindent=\parindent}

% 流程图定义基本形状
\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{io} = [trapezium, trapezium left angle=75, trapezium right angle=105, minimum width=1cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{process} = [rectangle, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{decision} = [diamond, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{arrow} = [thick,->,>=stealth]

% Setting Package listings/lstlistings
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle={\footnotesize\ttfamily}, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em
}

% 定理环境
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
  \newtheorem{algo}{\bjtu@label@algo~}[chapter]
  \newtheorem{thm}{\bjtu@label@thm~}[chapter]
  \newtheorem{lem}[thm]{\bjtu@label@lem~}
  \newtheorem{prop}[thm]{\bjtu@label@prop~}
  \newtheorem{cor}[thm]{\bjtu@label@cor~}
\theoremstyle{definition}
  \newtheorem{defn}{\bjtu@label@defn~}[chapter]
  \newtheorem{conj}{\bjtu@label@conj~}[chapter]
  \newtheorem{exmp}{\bjtu@label@exmp~}[chapter]
  \newtheorem{rem}{\bjtu@label@rem~}
  \newtheorem{case}{\bjtu@label@case~}
\theoremstyle{break}
  \newtheorem{bthm}[thm]{\bjtu@label@thm~}
  \newtheorem{blem}[thm]{\bjtu@label@lem~}
  \newtheorem{bprop}[thm]{\bjtu@label@prop~}
  \newtheorem{bcor}[thm]{\bjtu@label@cor~}
  \renewcommand{\proofname}{\bf\bjtu@label@proof}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following definitions are to extend the LaTeX algorithmic 
% package with SWITCH statements and one-line structures.
% The extension is by 
%   Prof. Farn Wang 
%   Dept. of Electrical Engineering, 
%   National Taiwan University. 
% 
\newcommand{\SWITCH}[1]{\STATE \textbf{switch} (#1)}
\newcommand{\ENDSWITCH}{\STATE \textbf{end switch}}
\newcommand{\CASE}[1]{\STATE \textbf{case} #1\textbf{:} \begin{ALC@g}}
\newcommand{\ENDCASE}{\end{ALC@g}}
\newcommand{\CASELINE}[1]{\STATE \textbf{case} #1\textbf{:} }
\newcommand{\DEFAULT}{\STATE \textbf{default:} \begin{ALC@g}}
\newcommand{\ENDDEFAULT}{\end{ALC@g}}
\newcommand{\DEFAULTLINE}[1]{\STATE \textbf{default:} }
% 
% End of the LaTeX algorithmic package extension.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%==========
% Segment 4. Draw the bjtuthesis
%==========

\newcommand\classification[1]{\def\bjtu@value@classification{#1}}
\newcommand\studentnumber[1]{\def\bjtu@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\bjtu@value@confidential{#1}}
\newcommand\school[1]{\def\bjtu@value@school{#1}}
\newcommand\chinesedegree[1]{\def\bjtu@value@chinesedegree{#1}}
\renewcommand\title[2][\bjtu@value@title]{%
  \def\bjtu@value@title{#2}
  \def\bjtu@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\bjtu@value@author{#1}}
\newcommand\advisor[1]{\def\bjtu@value@advisor{#1}}
\newcommand\advisorjobtitle[1]{\def\bjtu@value@advisorjobtitle{#1}}
\newcommand\coadvisor[1]{\def\bjtu@value@coadvisor{#1}}
\newcommand\major[1]{\def\bjtu@value@major{#1}}
\newcommand\submitdate[1]{\def\bjtu@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\bjtu@value@defenddate{#1}}
\newcommand\institute[1]{\def\bjtu@value@institute{#1}}
\newcommand\chairman[1]{\def\bjtu@value@chairman{#1}}

% “绘制”BJTU中文封面
\renewcommand\makecover[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  \vspace*{65.5pt}
  \includegraphics[width=0.72025\textwidth]{figure/bjtubanner}
  \vskip 30pt
  {\songti\zihao{2}\textbf{\renewcommand{\CJKglue}{\hskip 5pt plus 0.08\baselineskip}\bjtu@label@statement}}
  \vskip 60pt
  {\songti\zihao{-3}\bjtu@value@title}
  \vskip 15pt
  {\songti\zihao{-3}\bjtu@value@englishtitle}
  \vskip\stretch{1}
  {\songti\zihao{4}作者：\bjtu@value@author}
  \vskip 20pt
  {\songti\zihao{4}导师：\bjtu@value@advisor}
  \vskip 100pt
  {\songti\zihao{4}\bjtu@value@school}
  \vskip 20pt
  {\songti\zihao{4}\bjtu@value@defenddate}
  \end{center}
  \cleardoublepage
}


% “绘制”BJTU中文标题页
\renewcommand\maketitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{4pt}
    \begin{tabular*}{\textwidth}{ @{}p{0.5\textwidth}  p{0.5\textwidth} }
      \zihao{5}学校代码：100004 & \hfill\zihao{5}密级：公开
    \end{tabular*}
  \end{center}
  \begin{center}
  \vspace*{25pt}
  {\kaishu\zihao{0}北京交通大学}
  \vskip 11pt
  {\songti\zihao{2}\textbf{\renewcommand{\CJKglue}{\hskip 5pt plus 0.08\baselineskip}\bjtu@label@statement}}
  \vskip 45pt
  {\songti\zihao{-3}\bjtu@value@title}
  \vskip 15pt
  {\songti\zihao{-3}\bjtu@value@englishtitle}
  \vskip 62pt
  \begin{tabular}{ @{}p{0.5\textwidth} p{0.5\textwidth}}
    \zihao{4}作者姓名：\bjtu@value@author & \zihao{4}学~~~~~~~~号：\bjtu@value@studentnumber \\
    & \\
    \zihao{4}导师姓名：\bjtu@value@advisor & \zihao{4}职~~~~~~~~称：\bjtu@value@advisorjobtitle \\
    & \\
    \zihao{4}
      \ifbjtu@professional\relax
        工程\bjtu@value@chinesedegree 专业领域：\bjtu@value@major
      \else
        \bjtu@value@chinesedegree 专业领域：\bjtu@value@major
      \fi
       & \zihao{4}学位级别：\bjtu@value@chinesedegree  \\
    & \\
  \end{tabular}
  \vskip\stretch{1}
  {\fangsong\zihao{4}}
  \def\tabcolsep{1pt}
  \def\arraystretch{1.5}
  {\songti\zihao{4}\bjtu@value@school}
  \vskip 20pt
  {\songti\zihao{4}\bjtu@value@defenddate}
  \end{center}
  \cleardoublepage
}


% English Title Page
\newcommand\englishtitle[1]{\def\bjtu@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\bjtu@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\bjtu@value@englishadvisor{#1}}
\newcommand\englishcoadvisor[1]{\def\bjtu@value@englishcoadvisor{#1}}
\newcommand\englishschool[1]{\def\bjtu@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\bjtu@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\bjtu@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\bjtu@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\bjtu@value@englishmajor{#1}}
% "绘制"英文标题页
\newcommand\makeenglishtitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
      {\normalfont\zihao{4} \bjtu@label@englishstatement} 
      \vspace{20pt} \vskip\stretch{1}
      {\huge\bjtu@value@englishtitle \vskip 1pt}
      \vskip \stretch{1}
    \ifbjtu@review
      \vskip \stretch{1}
      \vskip 3pt
      \vskip \stretch{2}
    \else
      {\normalfont\zihao{4}\bjtu@value@englishauthor} 
      \vskip \stretch{1}
      {\normalfont\zihao{4}\bjtu@label@englishadvisor} 
      \vskip 2pt
      {\normalfont\zihao{4}\bjtu@value@englishadvisor} 
      \vskip 5pt
      \ifx\bjtu@value@englishcoadvisor\undefined\else
        {\normalfont\zihao{4}\bjtu@label@englishcoadvisor} 
        \vskip 2pt
        {\normalfont\zihao{4}\bjtu@value@englishcoadvisor} 
        \vskip \stretch{2}
      \fi
    \fi 
    \normalfont\bjtu@value@englishinstitute \vskip 30pt
    \normalfont\bjtu@value@englishdate \vskip 20pt
  \end{center}
  \cleardoublepage
}

% 独创性声明
\newcommand\makeDeclareOriginal{%
  \cleardoublepage
  \chapter*{\bjtu@label@original\markboth{\bjtu@label@original}{}}
  {\par\zihao{-4}\bjtu@label@originalcontent\par}
  \vskip 40pt
  \hspace{2em}
  \bjtu@label@authorsign
  \hfill
  \hfill
  \hfill
  \bjtu@label@originalDate
  \hspace{1.5em}
  \cleardoublepage
}


% 授权声明
\newcommand\makeDeclareAuthorization{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{35pt}
  	{\bf\zihao{3} \bjtu@label@authorization}
  \end{center}
  \vskip 10pt
  {\par\zihao{-4}\bjtu@label@authorizationcontent\par}
  \vskip 105pt
  \par\bjtu@label@authorsign\hfill\bjtu@label@Supervisorsign\hfill\hspace{2em}\par
  \vskip 15pt
  \par\bjtu@label@originalDate\hfill\hspace{2em}\bjtu@label@originalDate\par
  \cleardoublepage
}

% 学位论文数据集
\newcommand\makeDataset{%
  \cleardoublepage
  \chapter*{\bjtu@label@dataset\markboth{\bjtu@label@dataset}{}}
  %\vskip 10pt
  \begin{center}
    \begin{table}[!hpb]
      \centering
      \caption{数据集页}
      \begin{tabular}{ | p{7em} | p{4em} | p{9em} | p{8em} | p{6em} |}
        \hline
        关键词* & 密级* & 中图分类号 & UDC & 论文资助 \\ \hline
          &  &  &  &  \\ \hline
        \multicolumn{2}{|l|}{学位授予单位名称*} & 学位授予单位代码* & 学位类别* & 学位级别* \\ \hline
        \multicolumn{2}{|l|}{北京交通大学} & 10004 &  &  \\ \hline
        \multicolumn{2}{|l|}{论文题名*} & \multicolumn{2}{l|}{并列题名} & 论文语种* \\ \hline
        \multicolumn{2}{|l|}{} & \multicolumn{2}{l|}{} &  \\ \hline
        作者姓名* & \multicolumn{2}{l|}{} & 学号* &  \\ \hline
        \multicolumn{2}{|l|}{培养单位名称*} & 培养单位代码* & 培养单位地址 & 邮编 \\ \hline
        \multicolumn{2}{|l|}{北京交通大学} & 10004 & 北京市海淀区西直门外上园村3号 & 100044 \\ \hline
        \multicolumn{2}{|l|}{工程领域*} & 研究方向* & 学制* & 学位授予年* \\ \hline
        \multicolumn{2}{|l|}{} &  &  &  \\ \hline
        论文提交日期* & \multicolumn{4}{l|}{} \\ \hline
        论导师姓名* & \multicolumn{2}{l|}{} & 职称* & \\ \hline
        评阅人 & \multicolumn{2}{l|}{答辩委员会主席*} & \multicolumn{2}{l|}{答辩委员会成员} \\ \hline
         & \multicolumn{2}{l|}{} & \multicolumn{2}{l|}{} \\
         & \multicolumn{2}{l|}{} & \multicolumn{2}{l|}{} \\ \hline
        \multicolumn{5}{|l|}{电子版论文提交格式  文本（ ）  图像（ ） 视频（ ） 音频（ ） 多媒体（ ） 其他（ ）} \\
        \multicolumn{5}{|l|}{推荐格式：application/msword；application/pdf} \\ \hline
        \multicolumn{2}{|l|}{电子版论文出版（发布）者} & \multicolumn{2}{l|}{电子版论文出版（发布）地} & 权限声明 \\ \hline
        \multicolumn{2}{|l|}{} & \multicolumn{2}{l|}{} &  \\ \hline
        论文总页数* & \multicolumn{4}{l|}{} \\ \hline
        \multicolumn{5}{|l|}{共33项，其中带*为必填数据，为21项。} \\ \hline
      \end{tabular}
    \end{table}
  \end{center}
  %\cleardoublepage
}

% fancyhdr页眉页脚设置

% 不显示页眉中的编号
\pagestyle{fancy}\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{#1}}{}}

\ifbjtu@bachelor
	% 本科学位论文页眉页脚设置
	%% 正文页眉页脚
	\fancypagestyle{main}{
	  \fancyhf{}
	  \fancyhead[L]{\includegraphics[width=0.22\textwidth]{figure/bjtubanner}}
	  \fancyhead[R]{\nouppercase{\small\songti\bjtu@value@titlemark}}
	  \fancyfoot[C]{\small 第~{\bfseries\thepage}~页\,共~{\bfseries\pageref{LastPage}}~页}
	  \renewcommand{\headheight}{32pt}
	}
	%% 开章页页眉页脚
	\fancypagestyle{plain}{% 设置开章页页眉页脚风格(只有页码作为页脚)
	  \fancyhf{}%
	  \fancyhead[L]{\nouppercase{\small\songti\includegraphics[width=0.22\textwidth]{figure/bjtubanner}}}
	  \fancyhead[R]{\nouppercase{\small\songti\bjtu@value@titlemark}}
	  \fancyfoot[C]{\small 第~{\bf\thepage}~页\,共~{\bf\pageref{LastPage}}~页}
	  \renewcommand{\headheight}{32pt}
	}
\else
	% 研究生学位论文页眉页脚设置
	\if@twoside
	  %% 正文页眉页脚
	  \fancypagestyle{main}{
	    \fancyhead[CE]{
        \small\songti\bjtu@value@school
        \bjtu@value@chinesedegree
        % 专硕
        \ifbjtu@professional\relax
          专业
        \fi
        \bjtu@label@thesis
      }
      \fancyhead[L]{}
      \fancyhead[R]{}
      \fancyhead[CO]{\nouppercase{\small\songti\leftmark}}
	    \fancyfoot[C]{\small ~{\bfseries\thepage}~}
	    \renewcommand{\headheight}{32pt}
	  }
	  %% 开章页页眉页脚
	  \fancypagestyle{plain}{
	    \fancyhf{}
	    \fancyhead[CE]{\nouppercase{
        \small\songti\bjtu@value@school
        \bjtu@value@chinesedegree
        % 专硕
        \ifbjtu@professional\relax
          专业
        \fi
        \bjtu@label@thesis
      }}
      \fancyhead[L]{}
      \fancyhead[R]{}
	    \fancyhead[CO]{\nouppercase{\small\songti\leftmark}}
	    \fancyfoot[C]{\small ~{\bf\thepage}~}
	    \renewcommand{\headheight}{32pt}
	  }
	\else
	%% 正文页
	\fancypagestyle{main}{
	  \fancyhead[L]{
      \small\songti\bjtu@value@school
      \bjtu@value@chinesedegree
      % 专硕
      \ifbjtu@professional\relax
        专业
      \fi
      \bjtu@label@thesis
    }
	  \fancyhead[R]{\nouppercase{\small\songti\leftmark}}
	  \fancyfoot[C]{\small ~{\bf\thepage}~}
	  \renewcommand{\headheight}{32pt}
	}
	\fancypagestyle{plain}{
	  \fancyhf{}
	  \fancyhead[L]{\nouppercase{
      \small\songti\bjtu@value@school
      \bjtu@value@chinesedegree
      % 专硕
      \ifbjtu@professional\relax
        专业
      \fi
      \bjtu@label@thesis
    }}
    \fancyhead[R]{\nouppercase{\small\songti\leftmark}}
	  % \fancyhead[L]{\small {\it\bjtu@value@titlemark}}
	  \fancyfoot[C]{\small ~{\bf\thepage}~}
	  \renewcommand{\headheight}{32pt}
	}
	\fi
\fi

% 序言
\newenvironment{introduction}{
  \chapter*{\bjtu@label@introduction}
  \markboth{\bjtu@label@introduction}
  {}
}

% 中英文摘要
\newenvironment{abstract}{\chapter*{\bjtu@label@abstract}\markboth{\bjtu@label@abstract}{}}{}
\newcommand\keywords[1]{\noindent{\bf\songti\zihao{-4} \bjtu@label@keywords} #1}
\newenvironment{englishabstract}{\chapter*{\bfseries \bjtu@label@englishabstract}\markboth{\bjtu@label@englishabstract}{}}{}
\newcommand\englishkeywords[1]{\noindent{\bf\zihao{-4} \bjtu@label@englishkeywords} #1}

\renewcommand\tableofcontents{%
  \chapter*{\contentsname}
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \@starttoc{toc}%
}

\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}

\newenvironment{publications}[1]
     {\chapter{\bjtu@label@publications}%
      \@mkboth{\MakeUppercase\bjtu@label@publications}
              {\MakeUppercase\bjtu@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}

\newenvironment{patents}[1]
     {\chapter{\bjtu@label@patents}%
      \@mkboth{\MakeUppercase\bjtu@label@patents}
              {\MakeUppercase\bjtu@label@patents}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `patents' environment}}%
      \endlist}

\newenvironment{archivements}[1]
     {\chapter{\bjtu@label@archivements}%
      \@mkboth{\MakeUppercase\bjtu@label@archivements}
              {\MakeUppercase\bjtu@label@archivements}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `archivements' environment}}%
      \endlist}

\newenvironment{projects}[1]
     {\chapter{\bjtu@label@projects}%
      \@mkboth{\MakeUppercase\bjtu@label@projects}
              {\MakeUppercase\bjtu@label@projects}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `projects' environment}}%
      \endlist}

\newenvironment{resume}
  {\chapter{\bjtu@label@resume}}
  {}
  
\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
   {\endlist}
   
\newenvironment{resumelist}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
   {\endlist}
   
\renewenvironment{thanks}{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{35pt}
    {\heiti\zihao{3}\bjtu@label@thanks}
  \end{center}
  {}
}

\newenvironment{summary}
{\chapter*{\bjtu@label@summary\markboth{\bjtu@label@summary}{}}\addcontentsline{toc}{chapter}{\bjtu@label@summary}
}{}

\newenvironment{symbolnote}{\chapter{\bjtu@label@symbolnote}}{} 

\endinput

%%
%% End of file `bjtuthesis.cls'.



