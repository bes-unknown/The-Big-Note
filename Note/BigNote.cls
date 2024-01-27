\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{BigNote}[2023/1/18 v1.0 class for BigNote]

\LoadClass[10pt]{book}

\RequirePackage{fontspec}
\RequirePackage[CJKchecksingle]{xeCJK}
\RequirePackage{CJKnumb}
\RequirePackage[intlimits]{amsmath}
\RequirePackage{amssymb}
\RequirePackage[centercolon]{mathtools}
\RequirePackage{pdfpages}
\RequirePackage{xstring}
\RequirePackage{emptypage}
\RequirePackage[many]{tcolorbox}
\RequirePackage{setspace}
\RequirePackage[backend=biber, hyperref=auto, backref=true, backrefstyle=three]{biblatex}
\RequirePackage{tikz}
\RequirePackage{paralist}
\RequirePackage[iso, english]{isodate}
\RequirePackage{amsmath}
\RequirePackage[hidelinks,colorlinks = true,linkcolor = blue,citecolor = red,urlcolor = teal]{hyperref}
\RequirePackage{mathtools}
\RequirePackage{physics}
\RequirePackage{geometry}

\geometry{b5paper, scale = 0.7, asymmetric}

\RequirePackage[thmmarks, amsmath, hyperref]{ntheorem}

    \newtheorem{theorem}{定理}[section] % 按section编号
    \newtheorem{corollary}[theorem]{推论}
    \newtheorem{lemma}[theorem]{引理}
    \newtheorem{proposition}[theorem]{命题}
    \newtheorem{definition}[theorem]{定义}
    \newtheorem{definition-theorem}[theorem]{定义--定理}
    \newtheorem{definition-proposition}[theorem]{定义--命题}
    \newtheorem{hypothesis}[theorem]{假设}
    \newtheorem{conjecture}[theorem]{猜想}
    \newtheorem{axiom}[theorem]{公理}
    \newtheorem{example}[theorem]{例}
    \newtheorem{remark}[theorem]{注记}
    \newtheorem{convention}[theorem]{约定}
    \newtheorem{exercise}[theorem]{练习}
    \newenvironment{proof}{
        \vspace{1ex}
        \bfseries 证明 \normalfont
    }{\hfill $\square$ \par \vspace{1ex}}

% 天眉页脚
\RequirePackage{fancyhdr}

\fancypagestyle{plain}{
    \fancyhead{}
    \renewcommand{\headrulewidth}{0pt}
}

\renewcommand{\chaptermark}[1]{\markboth{
    第\CJKnumber{\thechapter}章\quad #1
    }{}}
\renewcommand{\sectionmark}[1]{\markright{\S\arabic{chapter}.\arabic{section} \quad #1}}

\fancyhead[EC]{\CJKfamily{hei2}\footnotesize{\leftmark}\vspace{1mm}}
\fancyhead[OC]{\CJKfamily{hei2}\footnotesize{\rightmark}\vspace{1mm}}
\fancyhead[LE,RO]{{\footnotesize \thepage}\vspace{1mm}} %
\fancyhead[RE,LO]{}


% Bibliography
\renewcommand{\contentsname}{目录}
% \renewcommand{\refname}{参考文献}
\renewcommand{\bibname}{参考文献}
\DefineBibliographyStrings{english}{%
    in = {刊于},
    editor = {主编},
    byeditor = {编者为},
    backrefpage = {引用于 p.\!},
    backrefpages = {引用于 pp.\!},
}

% Titles
\RequirePackage{titlesec}
\titleformat{\chapter}[hang]{\centering\huge\bfseries}{第\CJKnumber{\thechapter}章}{1em}{}

% References
\newcommand{\setlabel}[1]{\makeatletter\def\@currentlabel{#1}\makeatother}

% Let subsubsection be numbered
\setcounter{secnumdepth}{3}
