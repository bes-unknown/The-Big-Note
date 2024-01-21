\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Btexbook}[2023/1/18 v1.0 Btexbook class (modified from article.cls)]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse

    % Geometry options
    \DeclareOption{a4paper}
      {\setlength\paperheight {297mm}%
      \setlength\paperwidth  {210mm}}
    \DeclareOption{a5paper}
      {\setlength\paperheight {210mm}%
      \setlength\paperwidth  {148mm}}
    \DeclareOption{b5paper}
      {\setlength\paperheight {250mm}%
      \setlength\paperwidth  {176mm}}

    % Font size options
      \DeclareOption{10pt}{\renewcommand\@ptsize{10}}
      \DeclareOption{11pt}{\renewcommand\@ptsize{11}}
      \DeclareOption{12pt}{\renewcommand\@ptsize{12}}
    

\ExecuteOptions{b5paper,10pt}
\ProcessOptions

      % Font size Options following (10pt, 11pt, 12pt)
      \input{size\@ptsize.clo}

      % Line spacing
      \setlength\lineskip{1\p@}
      \setlength\normallineskip{1\p@}
      \setlength\arraycolsep{5\p@}
      \setlength\tabcolsep{6\p@}
      \setlength\arrayrulewidth{.4\p@}
      \setlength\doublerulesep{2\p@}
      \setlength\tabbingsep{\labelsep}
      \skip\@mpfootins = \skip\footins
      \setlength\fboxsep{3\p@}
      \setlength\fboxrule{.4\p@}

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection\quad
        \fi
        ##1}}{}}%
    \def\subsectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\@ne
          \thesubsection\quad
        \fi
        ##1}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \thesection\quad
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
    }

\setcounter{secnumdepth}{3}
\newcounter {chapter}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\newcommand\chapter{%
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
    \secdef\@chapter\@schapter}

  \def\@chapter[#1]#2{
        \refstepcounter{chapter}%
        \addcontentsline{toc}{chapter}{\thechapter\hspace{1em}#1}
        {\parindent \z@ \raggedright
        \interlinepenalty \@M
        \normalfont
        \hfill \Large\bfseries 第 \thechapter 章
        \par\nobreak
        \hfill \huge \bfseries #2%
        \markboth{}{}\par}

      \nobreak
      \vskip 3ex
      \@afterheading
      }
  \def\@schapter#1{
      \addcontentsline{toc}{chapter}{#1}
      {\parindent \z@ \raggedright
      \interlinepenalty \@M
      \normalfont
      \hfill \huge \bfseries #1\par}%
      \nobreak
      \vskip 3ex
      \@afterheading}

\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\hfill \normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}

\@addtoreset {equation}{section}
\renewcommand \theequation {\thesection.\@arabic\c@equation}

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \section*{目录}
    \@starttoc{toc}%
}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil
       \hb@xt@\@pnumwidth{\hss #2%
                          \kern-\p@\kern\p@}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{4}{7.0em}{4.1em}}

\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}

\def\today{
  \number\year 年 \ifcase\month\or
  1 月 \or 2 月 \or 3 月 \or 4 月 \or 5 月 \or 6 月 \or
  7 月 \or 8 月 \or 9 月 \or 10 月\or 11 月 \or 12 月\fi
  \space\number\day 日
}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{lipsum}
\usepackage{xeCJK}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{tikz}
\RequirePackage{physics}

% Support for math

\newcounter{math}[section]

\renewcommand{\themath}{\thesection.\arabic{math}}

  % definition
  \newenvironment{definition}{
    \vspace{1ex}
    \refstepcounter{math}
    \bfseries 定义 \themath \normalfont
    \def\@currentlabel{定义 \themath}
  }{\vspace{1ex} \par}
  \newenvironment{definition*}[1][]{
    \vspace{1ex}
    \refstepcounter{math}
    \bfseries 定义 \themath \quad (#1) \normalfont
    \def\@currentlabel{定义 \themath}
  }{\par \vspace{1ex}}

  % theorem
  \newenvironment{theorem}{
    \vspace{1ex}
    \refstepcounter{math}
    \bfseries 定理 \themath \normalfont
    \def\@currentlabel{定理 \themath}
  }{\vspace{1ex} \par}
  \newenvironment{theorem*}[1][]{
    \vspace{1ex}
    \refstepcounter{math}
    \bfseries 定理 \themath \quad (#1) \normalfont
    \def\@currentlabel{定理 \themath}
  }{\par \vspace{1ex}}

  % lemma
  \newenvironment{lemma}{
    \vspace{1ex}
    \refstepcounter{math}
    \bfseries 引理 \themath \normalfont
    \def\@currentlabel{引理 \themath}
  }{\vspace{1ex} \par}
  \newenvironment{lemma*}[1][]{
    \vspace{1ex}
    \refstepcounter{math}
    \bfseries 引理 \themath \quad (#1) \normalfont
    \def\@currentlabel{引理 \themath}
  }{\par \vspace{1ex}}

  % corollary
  \newenvironment{corollary}{
    \vspace{1ex}
    \refstepcounter{math}
    \bfseries 推论 \themath \normalfont
    \def\@currentlabel{推论 \themath}
  }{\vspace{1ex} \par}
  \newenvironment{corollary*}[1][]{
    \vspace{1ex}
    \refstepcounter{math}
    \bfseries 推论 \themath \quad (#1) \normalfont
    \def\@currentlabel{推论 \themath}
  }{\par \vspace{1ex}}

  % example
  \newenvironment{example}{
    \vspace{1ex}
    \refstepcounter{math}
    \bfseries 例 \themath \normalfont
    \def\@currentlabel{例 \themath}
  }{\vspace{1ex} \par}
  \newenvironment{example*}[1][]{
    \vspace{1ex}
    \refstepcounter{math}
    \bfseries 例 \themath \quad (#1) \normalfont
    \def\@currentlabel{例 \themath}
  }{\par \vspace{1ex}}

  % remark
  \newenvironment{remark}{
    \vspace{1ex}
    \refstepcounter{math}
    \bfseries 注 \themath \normalfont
    \def\@currentlabel{注 \themath}
  }{\vspace{1ex} \par}
  \newenvironment{remark*}[1][]{
    \vspace{1ex}
    \refstepcounter{math}
    \bfseries 注 \themath \quad (#1) \normalfont
    \def\@currentlabel{注 \themath}
  }{\par \vspace{1ex}}

  % exercise
  \newenvironment{exercise}{
    \vspace{1ex}
    \refstepcounter{math}
    \bfseries 习题 \themath \normalfont
    \def\@currentlabel{习题 \themath}
  }{\vspace{1ex} \par}
  \newenvironment{exercise*}[1][]{
    \vspace{1ex}
    \refstepcounter{math}
    \bfseries 习题 \themath \quad (#1) \normalfont
    \def\@currentlabel{习题 \themath}
  }{\par \vspace{1ex}}

  % proof
  \newenvironment{proof}{
    \vspace{1ex}
    \bfseries 证明 \normalfont
  }{\hfill $\square$ \par \vspace{1ex}}

% Header and Footer

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[RE]{\leftmark}
\fancyhead[LO]{\rightmark}
\renewcommand{\headrulewidth}{0pt}

% Cover page

\def\@author{authorname}
\def\@title{bookname}

\newcommand{\coverpage}{
  \thispagestyle{empty}
  \begin{center}
    \vspace*{1cm}
    \Huge\bfseries \@title
    \vspace{1cm}
    \par\normalfont\large\@author
    \vfill
    \vfill
    \large\bfseries \today
  \end{center}
  \clearpage
}

% Enumeration

\setlength\leftmargini  {2.5em}
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi  {\labelitemfont \textbullet}
\newcommand\labelitemii {\labelitemfont \bfseries \textendash}
\newcommand\labelitemiii{\labelitemfont \textasteriskcentered}
\newcommand\labelitemiv {\labelitemfont \textperiodcentered}
\newcommand\labelitemfont{\normalfont}
