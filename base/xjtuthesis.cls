% multiple1902 <multiple1902@gmail.com>
% xjtuthesis.cls
% Copyright 2011, multiple1902 (Weisi Dai)
% https://code.google.com/p/xjtuthesis/
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Weisi Dai.
%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{xjtuthesis}
[2011/7/15 0.0.1 Xi'an Jiaotong University Dissertation Template]

\def\xjtuthesis{XJTUthesis}
\def\meta@version{0.2.1}
\def\meta@codename{Monet}
\def\metaversion{\meta@version}

\newif\ifxjtu@bachelor  \xjtu@bachelorfalse
\newif\ifxjtu@master    \xjtu@masterfalse
\newif\ifxjtu@doctor    \xjtu@doctorfalse
\newif\ifxjtu@bigskip   \xjtu@bigskipfalse
\newif\ifxjtu@truefont  \xjtu@truefontfalse
\newif\ifxjtu@pdflinks  \xjtu@pdflinksfalse
\newif\ifxjtu@colorlinks\xjtu@colorlinksfalse

\DeclareOption{bachelor}    {\xjtu@bachelortrue}
\DeclareOption{master}      {\xjtu@mastertrue}
\DeclareOption{doctor}      {\xjtu@doctortrue}
\DeclareOption{bigskip}     {\xjtu@bigskiptrue} % bachelor only
\DeclareOption{truefont}    {\xjtu@truefonttrue}
\DeclareOption{pdflinks}    {\xjtu@pdflinkstrue}
\DeclareOption{colorlinks}  {\xjtu@colorlinkstrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions\relax

\LoadClass[openany]{book}

\ifxjtu@bachelor\relax\else
  \ifxjtu@master\relax\else
    \ifxjtu@doctor\relax\else
      \ClassError{xjtuthesis}%
                 {You have to specify one of thesis options: bachelor, master or doctor.}{}
    \fi
  \fi
\fi

% papersize: A4
\setlength\paperheight {297mm}
\setlength\paperwidth  {210mm}

% CJK character support
\RequirePackage{fontspec,xltxtra,xunicode}
\RequirePackage[slantfont,boldfont,CJKnumber,CJKtextspaces,CJKmathspaces]{xeCJK}
\punctstyle{kaiming}

% math & format packages
\RequirePackage[fleqn]{amsmath} % amssymb ?
\RequirePackage{indentfirst}
%\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{tabularx}
\RequirePackage{threeparttable}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{subfig}
%\RequirePackage[labelsep=quad]{caption}
\RequirePackage[numbers,super,square,sort&compress]{natbib}
%\RequirePackage{appendix}

% padding
\RequirePackage[left=2.6cm, right=2.6cm,top=3.0cm,bottom=2.5cm]{geometry}

% header & footer
\RequirePackage{fancyhdr}

% titleformat
\RequirePackage{titlesec,titletoc}

% l10n here
\renewcommand{\tablename}{表} 
\renewcommand{\figurename}{图} 
%\renewcommand{\refname}{参考资料}
%\renewcommand{\abstractname}{摘要}

\ifxjtu@pdflinks
    \RequirePackage{hyperref}
    \ifxjtu@colorlinks
        \hypersetup{
            bookmarksnumbered=true,
            bookmarksopen=true,
            bookmarksopenlevel=1,
            breaklinks=true,
            colorlinks=true,
            linkcolor=blue,
            anchorcolor=blue,
            citecolor=green,
            plainpages=false,
            pdfpagelabels,
            pdfborder=0 0 0,
        }
    \else
        \hypersetup{
            bookmarksnumbered=true,
            bookmarksopen=true,
            bookmarksopenlevel=1,
            breaklinks=true,
            colorlinks=false,
            plainpages=false,
            pdfpagelabels,
            pdfborder=0 0 0,
        }
    \fi
    \urlstyle{same}
\fi

% font-size
\newlength\thu@linespace
\newcommand{\thu@choosefont}[2]{%
  \setlength{\thu@linespace}{#2*\real{#1}}%
  \fontsize{#2}{\thu@linespace}\selectfont}
\def\thu@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \thu@choosefont{##1}{#2}}}
\thu@define@fontsize{chuhao}{42bp}
\thu@define@fontsize{xiaochu}{36bp}
\thu@define@fontsize{yihao}{26bp}
\thu@define@fontsize{xiaoyi}{24bp}
\thu@define@fontsize{erhao}{22bp}
\thu@define@fontsize{xiaoer}{18bp}
\thu@define@fontsize{sanhao}{16bp}
\thu@define@fontsize{xiaosan}{17bp}
\thu@define@fontsize{sihao}{14bp}
\thu@define@fontsize{banxiaosi}{13bp}
\thu@define@fontsize{xiaosi}{12bp}
\thu@define@fontsize{dawu}{11bp}
\thu@define@fontsize{wuhao}{10.5bp}
\thu@define@fontsize{xiaowu}{9bp}
\thu@define@fontsize{liuhao}{7.5bp}
\thu@define@fontsize{xiaoliu}{6.5bp}
\thu@define@fontsize{qihao}{5.5bp}
\thu@define@fontsize{bahao}{5bp}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}
  \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=10bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip}

% header & footer
\def\ps@thu@empty{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty}
\def\ps@thu@plain{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \def\@oddfoot{\hfil\wuhao\thepage\hfil}%
  \let\@evenfoot=\@oddfoot}

% font-family
\ifxjtu@truefont
  \setmainfont{Times New Roman}
  \setCJKmainfont{SimSun}
  \setCJKsansfont{SimHei}
  \setCJKmonofont{SimSun}
\else
  \setmainfont{Nimbus Roman No9 L}
  \setCJKmainfont{文鼎ＰＬ简报宋}
  \setCJKsansfont{文泉驿微米黑}
  \setCJKmonofont{文鼎ＰＬ简报宋}
\fi
\setsansfont{Arial}
\setmonofont{Courier New}

\def\thu@define@term#1{
\long\expandafter\gdef\csname #1\endcsname##1{% defines a macro like \ctitle#1: \def\xjtu@ctitle{#1}
    \long\expandafter\gdef\csname xjtu@#1\endcsname{##1}}
  \csname #1\endcsname{}} % the initial value=NULLSTR

\newcommand\engcontentsname{CONTENTS}
\newcommand\tableofengcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\engcontentsname
        \@mkboth{%
           \MakeUppercase\engcontentsname}{\MakeUppercase\engcontentsname}}%
    \@starttoc{toe}%
    \if@restonecol\twocolumn\fi
    }
\newcommand\addengcontents[2]{%
    \addcontentsline{toe}{#1}{\protect\numberline{\csname the#1\endcsname}#2}}

\newcommand\echapter[1]{\addengcontents{chapter}{#1}}
\newcommand\esection[1]{\addengcontents{section}{#1}}
\newcommand\esubsection[1]{\addengcontents{subsection}{#1}}

% circled footnote number
\renewcommand{\thefootnote}{\raisebox{.5pt}{\textcircled{\raisebox{-.9pt}{\arabic{footnote}}}}} % http://tex.stackexchange.com/questions/7032/good-way-to-make-textcircled-numbers

\thu@define@term{type}
\newcommand\xjtucover{}
\newcommand\xjtucinfopage{}
\newcommand\xjtueinfopage{}
\newcommand\xjtucontent{}
\newcommand\xjtutoc{
    \tableofcontents
    \chaptermark{目录}
}
\newcommand\xjtuspchapter[2]{
    \chapter*{#2}
    \chaptermark{#1}
}
\thu@define@term{cauthor}
\thu@define@term{ctitle}
\thu@define@term{csupervisor}
\thu@define@term{cabstract}
\thu@define@term{ckeywords}

\thu@define@term{eauthor}
\thu@define@term{etitle}
\thu@define@term{esupervisor}
\thu@define@term{eabstract}
\thu@define@term{ekeywords}

\newcommand\xjtutype{\xjtu@type}

% geometry
\topmargin=-1in % 消除页眉-边界距离初始值
\headheight=8mm 
\headsep=2mm
\textheight=242mm % 297-30-25
\footskip=7.5mm
\setlength\voffset{2cm} % 规范：页眉距边界2.0cm
\pagenumbering{roman}
\xiaosi
\setlength{\parindent}{2em}

\ifxjtu@bachelor

    \if\ifxjtu@bigskip
      \linespread{1.5}
    \else
      \linespread{1.2}
    \fi
    
    \setcounter{secnumdepth}{3}

    \titleformat{\section}[hang]{\xiaosan \CJKfamily{hei}}{}{0em}{\thesection\quad }[\vskip -0.5em]
    \titleformat{\subsection}{\sihao \CJKfamily{hei}}{}{0em}{\vskip -1.5em \thesubsection\quad{}}%[\vskip -1em] % 太丑啦, 求workaround
    \titleformat{\subsubsection}{\CJKfamily{hei}}{}{0em}{\thesubsubsection\quad}[]

    \let\oldtableofcontents=\tableofcontents
    \def\tableofcontents{
        \titleformat{\chapter}[block]{\sanhao \CJKfamily{hei}}{}{0em}{\begin{center}}[\end{center}]
      \oldtableofcontents
    }

  \renewcommand\footnoterule{\vspace*{-3pt}% eggache!
       \hrule width 0.25\textwidth height 0.4pt
            \vspace*{2.6pt}}
                
    \fancypagestyle{plain}{%
      \fancyhf{}
      \fancyhead[CO]{\if@mainmatter\wuhao \leftmark\fi}
      \fancyhead[CE]{\wuhao \ifxjtu@bachelor
                        西安交通大学本科毕业设计(论文)
                        \fi}
      \fancyfoot[OR,EL]{\small ~\thepage~}
      \renewcommand{\headrulewidth}{\if@mainmatter 0.5pt\else 0pt \fi}
      \renewcommand{\headrule}{\hrule \@height \headrulewidth \@width \headwidth
      \hrule \@height \headrulewidth \@width \headwidth \vskip -\headrulewidth}

    }
    \pagestyle{plain}


    \newenvironment{denotation}[1][2.5cm]{ % much thanks to THUthesis!
      \chapter*{主要符号表}
      \addcontentsline{toc}{chapter}{主要符号表}
      \chaptermark{主要符号表}
      \noindent\begin{list}{}%
        {\vskip-30bp %\xiaosi[1.6]
         \renewcommand\makelabel[1]{##1\hfil}
         \setlength{\labelwidth}{#1} % 标签盒子宽度
         \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
         \setlength{\itemindent}{1em} % 标签缩进量
         \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
         \setlength{\rightmargin}{0cm}
         \setlength{\parsep}{0cm} % 段落间距
         \setlength{\itemsep}{0cm} % 标签间距
        \setlength{\listparindent}{0cm} % 段落缩进量
        \setlength{\topsep}{0pt} % 标签与上文的间距
       }}{\end{list}}

    \renewcommand\contentsname{目\quad \quad 录}
    \type{本科}
    \renewcommand\xjtucinfopage{
        \chaptermark{摘要}
        \noindent {\bf
        论文题目： \xjtu@ctitle\\
        学生姓名： \xjtu@cauthor\\
        指导教师： \xjtu@csupervisor\\
        }

        \begin{center}
          \sanhao
          摘\qquad 要
        \end{center}

        {\xiaosi \xjtu@cabstract}

        \mbox{}

        {\wuhao \noindent
            {\bf 关键词}：
        \xjtu@ckeywords}
        \clearpage
    }
    \renewcommand\xjtueinfopage{
        \chaptermark{ABSTRACT}
        \noindent {\bf
        Title: \xjtu@etitle\\
        Name: \xjtu@eauthor\\
        Supervisor: \xjtu@esupervisor\\
        }

        \begin{center}
          \sanhao
          ABSTRACT
        \end{center}


        {\xiaosi
        \setlength{\parindent}{0em}
        \setlength{\parskip}{1em}
        \xjtu@eabstract
        }

        \mbox{ }

        {\wuhao\noindent
            {\bf KEY WORDS: }
            \xjtu@ekeywords
        }

        \clearpage
    }

    % booktabs parameters
    \setlength\cmidrulewidth {1.0pt}
    \setlength\lightrulewidth{1.0pt}
    \setlength\heavyrulewidth{1.5pt}

    \renewcommand\xjtucontent{
        \ifodd\thepage\else
         \fancypagestyle{plain}{%
          \fancyhf{}
          \fancyhead[CE]{\if@mainmatter\wuhao \leftmark\fi}
          \fancyhead[CO]{\wuhao \ifxjtu@bachelor
                            西安交通大学本科毕业设计(论文)
                            \fi}
          \fancyfoot[ER,OL]{\small ~\thepage~}
          \renewcommand{\headrulewidth}{\if@mainmatter 0.5pt\else 0pt \fi}
          \renewcommand{\headrule}{\hrule \@height \headrulewidth \@width \headwidth
          \hrule \@height \headrulewidth \@width \headwidth \vskip -\headrulewidth}
        }
        \pagestyle{plain}
       \fi

           
        \pagenumbering{arabic}
        %\pagestyle{fancy}
    }

    \newcommand{\xjtubib}[1]{ {
        \wuhao
        %\bibliographystyle{plain}
        \bibliographystyle{GBT7714-2005NLang-UTF8}
        \bibliography{#1}
        } }

   \let\oldfootnote\footnote
   \renewcommand \footnote[1]{\oldfootnote{\xiaowu #1}}


    \renewcommand{\chaptermark}[1]{\markboth{#1}{}}
    \renewcommand{\sectionmark}[1]{\markright{#1}{}}

    \newcommand{\xjtuappendix}{
        \begin{appendix}
        \renewcommand{\thechapter}{附录\arabic{chapter}}
    }
    \newcommand{\xjtuendappendix}{\end{appendix}}
    \newcommand{\xjtuappendixchapter}[1]{
        \stepcounter{chapter}
        \chapter*{\thechapter\quad#1}
        \addcontentsline{toc}{chapter}{\thechapter\quad #1}
    }
    \newcommand{\xjtuappendixsection}[1]{
        \stepcounter{section}
        \section*{#1}
        \addcontentsline{toc}{section}{\thesection\quad #1}
    }
    \newcommand{\xjtuappendixsubsection}[1]{
        \stepcounter{subsection}
        \subsection*{#1}
        \addcontentsline{toc}{subsection}{\thesubsection\quad #1}
    }
    \newcommand{\xjtuappendixsubsubsection}[1]{
        \stepcounter{subsubsection}
        \subsubsection*{#1}
        \addcontentsline{toc}{subsubsection}{\thesubsubsection\quad #1}
    }
        


\fi

\ifxjtu@master
    \linespread{1.0}
    % booktabs parameters
    \setlength\cmidrulewidth {1.0pt}
    \setlength\lightrulewidth{1.0pt}
    \setlength\heavyrulewidth{1.0pt}


    \renewcommand\xjtutype{硕士}
    \renewcommand\xjtucinfopage{
        \noindent 
        论文题目：\\
        学科专业：\\
        申请人：\\
        指导教师：\\
        

    }
   
\fi

\ifxjtu@doctor
    \linespread{2.0}
    % booktabs parameters
    \setlength\cmidrulewidth {1.0pt}
    \setlength\lightrulewidth{1.0pt}
    \setlength\heavyrulewidth{1.0pt}
    
    \renewcommand\xjtutype{博士}
    \renewcommand\xjtucinfopage{
        \noindent 
        论文题目：\\
        学科专业：\\
        申请人：\\
        指导教师：\\
        

    }

    \setlength{\cftbeforechapskip}{0ex}
    \setlength{\cftbeforesecskip}{1ex}
    \setlength{\cftbeforesecskip}{1ex}
    \setlength{\cftbeforesecskip}{1ex}

\fi

% borrowed from nenuthesis
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{remark}{注释}[chapter]
\newtheorem{problem}{问题}[chapter]
\newtheorem{conjecture}{猜想}[chapter]

\renewcommand{\bibname}{参考文献}
