% multiple1902 <multiple1902@gmail.com>
% xjtuthesis.cls
% Copyright 2011~2012, multiple1902 (Weisi Dai)
% https://code.google.com/p/xjtuthesis/
% 
% It is strongly recommended that you read documentations located at
%   http://code.google.com/p/xjtuthesis/wiki/Landing?tm=6
% in advance of your compilation if you have not read them before.
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

% Brand marks, and version info
\def\xjtuthesis{XJTUthesis}
\def\meta@version{0.4.2}
\def\meta@codename{Monet}
\def\metaversion{\meta@version}

% Option switches
\newif\ifxjtu@bachelor  \xjtu@bachelorfalse
\newif\ifxjtu@master    \xjtu@masterfalse
\newif\ifxjtu@doctor    \xjtu@doctorfalse
\newif\ifxjtu@bigskip   \xjtu@bigskipfalse
\newif\ifxjtu@truefont  \xjtu@truefontfalse
\newif\ifxjtu@nofont    \xjtu@nofontfalse
\newif\ifxjtu@pdflinks  \xjtu@pdflinksfalse
\newif\ifxjtu@colorlinks\xjtu@colorlinksfalse
\newif\ifxjtu@compact   \xjtu@compactfalse

\DeclareOption{bachelor}    {\xjtu@bachelortrue}
\DeclareOption{master}      {\xjtu@mastertrue}
\DeclareOption{doctor}      {\xjtu@doctortrue}
\DeclareOption{bigskip}     {\xjtu@bigskiptrue} % bachelor only
\DeclareOption{truefont}    {\xjtu@truefonttrue}
\DeclareOption{nofont}      {\xjtu@nofonttrue}
\DeclareOption{pdflinks}    {\xjtu@pdflinkstrue}
\DeclareOption{colorlinks}  {\xjtu@colorlinkstrue}
\DeclareOption{compact}     {\xjtu@compacttrue}

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

% Math & format packages
\RequirePackage[fleqn]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{indentfirst}
\RequirePackage{tabularx}
\RequirePackage{threeparttable}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{subfig}
\RequirePackage[numbers,super,square,sort&compress]{natbib}

% CJK character support
\RequirePackage{fontspec,xltxtra,xunicode}
\RequirePackage[slantfont,boldfont,CJKnumber]{xeCJK}
\punctstyle{kaiming}

% Padding
\RequirePackage[left=2.6cm, right=2.6cm,top=3.0cm,bottom=2.5cm,a4paper]{geometry}

% Header & footer
\RequirePackage{fancyhdr}

% titleformat
\RequirePackage{titlesec,titletoc}

% l10n here
\renewcommand{\tablename}{表} 
\renewcommand{\figurename}{图} 
\renewcommand{\bibname}{参考文献}
\renewcommand\contentsname{目\quad \quad 录}
\renewcommand\thefigure{% thanks to fitsir<at>gmail.com
     \ifnum \c@chapter>\z@\thechapter-\fi\@arabic\c@figure%
}
\renewcommand\thetable{%
    \ifnum \c@chapter >\z@ \thechapter -\fi \@arabic \c@table%
}
\renewcommand\theequation{%
    \ifnum \c@chapter >\z@ \thechapter -\fi \@arabic \c@equation%
}

\newcommand{\thesis}{thesis}
\newcommand{\Master}{Master}

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

% Font-size
% Used code from THUthesis. Many thanks!
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

% Header & footer styles
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

% Font-family
\ifxjtu@nofont\else
    \ifxjtu@truefont
      \setmainfont[Ligatures=TeX]{Times New Roman}
      \setCJKmainfont{SimSun}
    \else
      \setmainfont[Ligatures=TeX]{Nimbus Roman No9 L}
      \setCJKmainfont{文鼎ＰＬ简报宋}
    \fi
    \setsansfont{Arial}
    \setmonofont{Courier New}
\fi

\def\thu@define@term#1{
\long\expandafter\gdef\csname #1\endcsname##1{% defines a macro like \ctitle#1: \def\xjtu@ctitle{#1}
    \long\expandafter\gdef\csname xjtu@#1\endcsname{##1}}
  \csname #1\endcsname{}} % the initial value is NULLSTR

% Table of contents, in English
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
\newcommand\addengappendice[2]{%
    \addcontentsline{toe}{#1}{theappendix}#2}

\newcommand\echapter[1]{\addengcontents{chapter}{#1}}
\newcommand\esection[1]{\addengcontents{section}{#1}}
\newcommand\esubsection[1]{\addengcontents{subsection}{#1}}
\newcommand\eappendix[1]{\addengappendice{#1}}

% Circled footnote number
\renewcommand{\thefootnote}{\raisebox{.5pt}{\textcircled{\raisebox{-.9pt}{\arabic{footnote}}}}} % http://tex.stackexchange.com/questions/7032/good-way-to-make-textcircled-numbers

\thu@define@term{type}

\ifxjtu@master{
    \type{硕士}
\else
    \type{博士}
    \renewcommand{\thesis}{dissertation}
    \renewcommand{\Master}{Doctor}
\fi

% Interfaces, or commands
\newcommand\xjtucover{}
\newcommand\xjtuchead{}
\newcommand\xjtuehead{}
\newcommand\xjtucinfopage{}
\newcommand\xjtueinfopage{}
\newcommand\xjtucontent{}
\newcommand\xjtuendcontent{}
\newcommand\xjtutoc{
    \tableofcontents
    \chaptermark{目录}
}
\newcommand\xjtutoe{
    \tableofengcontents
}
\newcommand\xjtuspchapter[2]{
    \chapter*{#2}
    \chaptermark{#1}
    \addcontentsline{toc}{chapter}{#1}
}
\newcommand\xjtuincite[1]{ {%
    \citestyle{plain}%
    \cite{#1}%
    }%
}

% Interfaces, or terms
\thu@define@term{cauthor}
\thu@define@term{ctitle}
\thu@define@term{csupervisor}
\thu@define@term{cabstract}
\thu@define@term{ckeywords}
\thu@define@term{csubject}
\thu@define@term{cproddate}
\thu@define@term{ctype}

\thu@define@term{eauthor}
\thu@define@term{etitle}
\thu@define@term{ecate}
\thu@define@term{esupervisor}
\thu@define@term{eabstract}
\thu@define@term{ekeywords}
\thu@define@term{esubject}
\thu@define@term{eproddate}
\thu@define@term{etype}

\newcommand\xjtutype{\xjtu@type}

% Geometry specifications
\topmargin=-1in % 消除页眉-边界距离初始值
\headheight=8mm 
\headsep=2mm
\textheight=242mm % 297-30-25
\footskip=7.5mm
\setlength\voffset{2cm} % 规范：页眉距边界2.0cm
\pagenumbering{roman}
\xiaosi
\setlength{\parindent}{2em}

% Table of contents, style
\setcounter{secnumdepth}{3}

% Section titles, style
\titleformat{\chapter}[block]{\sanhao}{}{0em}{\begin{center}}[\end{center}]
\titleformat{\section}[hang]{\xiaosan}{}{0em}{\thesection\quad }[\vskip -0.5em]
\titleformat{\subsection}{\sihao}{}{0em}{\vskip -1.5em \thesubsection\quad{}}%[\vskip -1em] % 太丑啦, 求workaround
\titleformat{\subsubsection}{}{}{0em}{\thesubsubsection\quad}[]

% The denotation environment
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

\let\oldtableofcontents=\tableofcontents
\def\tableofcontents{
    \oldtableofcontents
}

% The ``compact'' option eliminates the empty pages
\ifxjtu@compact
    \let\oldcleardoublepage=\cleardoublepage
    \def\cleardoublepage{
        \clearpage
    }
\fi

\ifxjtu@bachelor

    \ifxjtu@bigskip
      \linespread{1.5} \selectfont
    \else
      \linespread{1.2} \selectfont
    \fi

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
      \renewcommand{\headrulewidth}{\if@mainmatter 0.5bp\else 0bp \fi}
      \renewcommand{\headrule}{\hrule \@height \headrulewidth \@width \headwidth \vskip .3pt
      \hrule \@height \headrulewidth \@width \headwidth \vskip -\headrulewidth}

    }
    \pagestyle{plain}

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

        \xjtu@cabstract

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


        {
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
        \ifodd\arabic{page}\else
            \fancypagestyle{plain}{%
                \fancyhf{}
                \fancyhead[CE]{\if@mainmatter\wuhao \leftmark\fi}
                \fancyhead[CO]{\wuhao \ifxjtu@bachelor
                                西安交通大学本科毕业设计(论文)
                                \fi}
                \fancyfoot[ER,OL]{\small ~\thepage~}
                \renewcommand{\headrulewidth}{\if@mainmatter 0.5bp\else 0bp \fi}
                \renewcommand{\headrule}{\hrule \@height \headrulewidth \@width \headwidth \vskip .3pt
                \hrule \@height \headrulewidth \@width \headwidth \vskip -\headrulewidth}
            }
            \pagestyle{plain}
        \fi
        \pagenumbering{arabic}
        \titleformat{\chapter}[block]{\sanhao}{}{0em}{\begin{center}\thechapter\quad}[\end{center}]
    }
    \renewcommand\xjtuendcontent{
        \titleformat{\chapter}[block]{\sanhao}{}{0em}{\begin{center}}[\end{center}]
    }

    \newcommand{\xjtubib}[1]{ {
        \clearpage
        \phantomsection % http://www.tex.ac.uk/cgi-bin/texfaq2html?label=tocbibind
        \addcontentsline{toc}{chapter}{参考文献}
        \wuhao
        \bibliographystyle{GBT7714-2005NLang-UTF8}
        \bibliography{#1}
        \clearpage
        } }

   \let\oldfootnote\footnote
   \renewcommand \footnote[1]{\oldfootnote{\xiaowu #1}}

    \renewcommand{\chaptermark}[1]{\markboth{#1}{}}
    \renewcommand{\sectionmark}[1]{\markright{#1}{}}

    \newcommand{\xjtuappendix}{
        \begin{appendix}
        \renewcommand{\thechapter}{附录\arabic{chapter}}
        \chaptermark{附录}
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
\else % postgraduate
    % booktabs parameters
    \setlength\cmidrulewidth {1.0pt}
    \setlength\lightrulewidth{1.0pt}
    \setlength\heavyrulewidth{2.0pt} % or 2.25pt

    \fancypagestyle{plain}{%
      \fancyhf{}
      \fancyhead[CO]{\if@mainmatter\wuhao \leftmark\fi}
      \fancyhead[CE]{\wuhao 西安交通大学\xjtu@type 学位论文}
      \fancyfoot[OR,EL]{\small ~\thepage~}
      \renewcommand{\headrulewidth}{\if@mainmatter 1bp\else 0bp \fi}
      \renewcommand{\headrule}{\hrule \@height \headrulewidth \@width \headwidth \vskip .8pt
      \hrule \@height \headrulewidth \@width \headwidth
      }
    }
    \pagestyle{plain}

    \renewcommand\xjtuchead{
        \thispagestyle{empty}
        \begin{center}
            \vskip 3cm
            \includegraphics[width=7cm]{XJTU.pdf} \\
            \vskip 3ex
            {\huge \xjtu@type 学位论文}

            \vskip 5cm
            {\bf \huge {\bf \xjtu@ctitle}}

            \vskip 9cm
            申\:\;请\:\;人： \xjtu@cauthor\\
            指导教师： \xjtu@csupervisor\\
            学科专业： \xjtu@csubject\\
            \xjtu@cproddate
            
        \end{center}
        \ifxjtu@compact\else
            \clearpage
            \phantom{x}
            \thispagestyle{empty}
        \fi
        \clearpage
    }

    \renewcommand\xjtuehead{
        \thispagestyle{empty}
        \begin{center}
            \vskip 3cm
            {\bf \huge \xjtu@etitle}

            \vskip 6cm
            {\huge 
            A \thesis\ submitted to \\
            Xi'an Jiaotong University\\
            in partial fulfillment of the requirement\\
            for the degree of\\
            \Master\ of \xjtu@ecate

            \vskip 6cm
            By \xjtu@eauthor\\
            (\xjtu@esubject)\\
            Supervisor: \xjtu@esupervisor\\
            \xjtu@eproddate
            }

        \end{center}
        \ifxjtu@compact\else
            \clearpage
            \phantom{x}
            \thispagestyle{empty}
        \fi
        \clearpage

    }

    \renewcommand\xjtucinfopage{
        \chaptermark{摘要}
        \pagestyle{plain}
        \pagenumbering{roman}
        \noindent {\bf \xiaosi
        论文题目： \xjtu@ctitle\\
        学科专业： \xjtu@csubject\\
        申\:\;请\:\;人： \xjtu@cauthor\\
        指导教师： \xjtu@csupervisor\\
        }

        \begin{center}
          \sanhao
          摘\qquad 要
        \end{center}

        \xjtu@cabstract

        \mbox{}

        {\wuhao \noindent
            {\bf 关\:\;键\:\;词}：
        \xjtu@ckeywords
        
        \noindent {\bf 论文类型}：
        \xjtu@ctype
        }
        \clearpage
    }
    \renewcommand\xjtueinfopage{
        \chaptermark{ABSTRACT}
        \noindent {\bf
        Title: \xjtu@etitle\\
        Speciality: \xjtu@esubject\\
        Applicant: \xjtu@eauthor\\
        Supervisor: \xjtu@esupervisor\\
        }

        \begin{center}
          \sanhao
          ABSTRACT
        \end{center}


        {
        \setlength{\parindent}{0em}
        \setlength{\parskip}{1em}
        \xjtu@eabstract
        }

        \mbox{ }

        {\wuhao\noindent
            {\bf KEY WORDS: }
            \xjtu@ekeywords
        
            \noindent {\bf TYPE OF \MakeUppercase{\thesis}} :
            \xjtu@etype
        }

        \clearpage
    }
    \let\oldxjtutoc=\xjtutoc
    \def\xjtutoc{
        \cleardoublepage
        \oldxjtutoc
    }

    \renewcommand\xjtucontent{
        % no need to mirror page heads here
        \pagenumbering{arabic}
        \titleformat{\chapter}[block]{\sanhao}{}{0em}{\begin{center}\thechapter\quad}[\end{center}]
    }
    \renewcommand\xjtuendcontent{
        \titleformat{\chapter}[block]{\sanhao}{}{0em}{\begin{center}}[\end{center}]
    }

    \newcommand{\xjtubib}[1]{ {
        \clearpage
        \phantomsection
        \addcontentsline{toc}{chapter}{参考文献}
        \addcontentsline{toe}{chapter}{References}
        \wuhao
        \bibliographystyle{GBT7714-2005NLang-UTF8}
        \bibliography{#1}
        \clearpage
        } }

   \let\oldfootnote\footnote
   \renewcommand \footnote[1]{\oldfootnote{\xiaowu #1}}

    \renewcommand{\chaptermark}[1]{\markboth{#1}{}}
    \renewcommand{\sectionmark}[1]{\markright{#1}{}}

    \newcommand{\xjtuappendix}{
        \begin{appendix}
        \renewcommand{\thechapter}{附录\arabic{chapter}}
        \chaptermark{附录}
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
    \renewcommand\xjtuspchapter[3]{
        \chapter*{#2}
        \chaptermark{#1}
        \addcontentsline{toc}{chapter}{#1}
        \addcontentsline{toe}{chapter}{#3}
    }

    \newcommand{\xjtuacademicintegrity}{ {% 仅供参考
        \cleardoublepage
        \chaptermark{声明}
        \begin{center}
            \sanhao 学位论文独创性声明（1）
        \end{center}
    本人声明：所呈交的学位论文系在导师指导下本人独立完成的研究成果。文中依法引用他人的成果，均已做出明确标注或得到许可。论文内容未包含法律意义上已属于他人的任何形式的研究成果，也不包含本人已用于其他学位申请的论文或成果。
    
    本人如违反上述声明，愿意承担以下责任和后果：
    \begin{enumerate} \itemsep1pt \parskip0pt \parsep0pt
        \item 交回学校授予的学位证书；
        \item 学校可在相关媒体上对作者本人的行为进行通报；
        \item 本人按照学校规定的方式，对因不当取得学位给学校造成的名誉损害，进行公开道歉。
        \item 本人负责因论文成果不实产生的法律纠纷。
    \end{enumerate}
    
    论文作者（签名）：\hskip 5cm 日期：\hskip 2cm 年\hskip 1cm 月\hskip 1cm日 \vskip 1cm

    \begin{center}
        \sanhao 学位论文独创性声明（2）
    \end{center}
    本人声明：研究生\hskip 2cm 所提交的本篇学位论文已经本人审阅，确系在本人指导下由该生独立完成的研究成果。

    本人如违反上述声明，愿意承担以下责任和后果：
    \begin{enumerate} \itemsep1pt \parskip0pt \parsep0pt
        \item 学校可在相关媒体上对本人的失察行为进行通报；
        \item 本人按照学校规定的方式，对因失察给学校造成的名誉损害，进行公开道歉。
        \item 本人接受学校按照有关规定做出的任何处理。
    \end{enumerate}

    指导教师（签名）：\hskip 5cm 日期：\hskip 2cm 年\hskip 1cm 月\hskip 1cm日 \vskip 1cm


\begin{center}
    \sanhao 学位论文知识产权权属声明
\end{center}
我们声明，我们提交的学位论文及相关的职务作品，知识产权归属学校。学校享有以任何方式发表、复制、公开阅览、借阅以及申请专利等权利。学位论文作者离校后，或学位论文导师因故离校后，发表或使用学位论文或与该论文直接相关的学术论文或成果时，署名单位仍然为西安交通大学。

    论文作者（签名）：\hskip 5cm 日期：\hskip 2cm 年\hskip 1cm 月\hskip 1cm日

    指导教师（签名）：\hskip 5cm 日期：\hskip 2cm 年\hskip 1cm 月\hskip 1cm日

    \noindent (本声明的版权归西安交通大学所有，未经许可，任何单位及任何个人不得擅自使用)

    \thispagestyle{empty}
    } }
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
