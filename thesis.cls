%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: LamdaLamdaLamda
%
% Date: 03/24/2020.
%
% License: GNU General Public License v3.0.
%
% Source: https://github.com/LamdaLamdaLamda.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[2019/09/01]
\ProvidesClass{thesis}[2019/09/01 Thesis package]
\LoadClass[12pt,a4paper,oneside,chapterprefix=true]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Packages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{setspace}
\RequirePackage{helvet}
\RequirePackage[pdftex]{graphicx} 
\RequirePackage{parskip}
\RequirePackage{hyperref}
\RequirePackage{parskip}
\RequirePackage[normalem]{ulem}
\RequirePackage{enumerate}
\RequirePackage{amsmath}
\RequirePackage{cases}
\RequirePackage{amssymb}
\RequirePackage{tasks}
\RequirePackage{ulem}
\RequirePackage{fancyhdr}
\RequirePackage{listings}
\RequirePackage{acronym}
\RequirePackage{multirow}
\RequirePackage{float}
\RequirePackage{tikz}
\RequirePackage{url}
\RequirePackage{soul}
\RequirePackage{pgfkeys}
\RequirePackage[english]{babel}
\RequirePackage[]{csquotes}
\RequirePackage[skip=8pt]{caption}
\RequirePackage[top=1.2in, bottom=1.2in, left=1.25in, right=1.25in,headsep=25pt,footskip=50pt]{geometry}
\RequirePackage{rotating}
\RequirePackage[toc,page]{appendix} 
\RequirePackage{titlesec}
\RequirePackage[backend=bibtex,style=numeric]{biblatex}
\RequirePackage{todonotes}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Configuration %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{biburllcpenalty}{7000}
\setcounter{biburlucpenalty}{8000}
\DeclareFieldFormat*{title}{#1}

\DeclareFieldFormat*{titlecase}{%
    \ifdef{\currentfield}
      {\ifcurrentfield{title}
         {\usefield{\uline}{\currentfield}}%
         {#1}}
      {#1}}

\renewcommand{\bibpagespunct}{\addcomma\linebreak[1]\addspace}
\renewbibmacro*{title}{%
  \ifboolexpr{
    test {\iffieldundef{title}}
    and
    test {\iffieldundef{subtitle}}
  }
    {}
    {\printtext{%
     \printtext[titlecase]{\usefield{\uline}{title}}%
     \setunit{\subtitlepunct}%
     \printfield[titlecase]{subtitle}}%
     \newunit}%
  \printfield{titleaddon}}

\DeclareFieldFormat*{titlecase}{
    \ifdef{\currentfield}
      {\ifcurrentfield{title}
         {\usefield{\uline}{\currentfield}}%
         {#1}}
      {#1}}

\Urlmuskip=0mu plus 1mu

\usepackage{float}
\onehalfspacing

\restylefloat{table}

\fancypagestyle{plain}{
\fancyhf{}
\fancyhead[RE,LO]{\leftmark} 
\fancyfoot[C]{\thepage} 
\renewcommand{\headrulewidth}{0.4pt}
}

\DeclareCaptionType{equ}[][]

% Define block styles for tikz
\usetikzlibrary{shapes,arrows}
\tikzstyle{decision} = [diamond, draw, fill=blue!20,
text width=4.5em, text badly centered, node distance=3cm, inner sep=0pt]
\tikzstyle{block} = [rectangle, draw, fill=blue!20,
text width=5em, text centered, rounded corners, minimum height=4em]
\tikzstyle{line} = [draw, -latex']
\tikzstyle{cloud} = [draw, ellipse,fill=red!20, node distance=3cm,
minimum height=2em]

% Distances between the text and the chapter-header
\titleformat{\chapter}{\huge}{\thechapter.}{5pt}{\huge\bfseries}
\titlespacing{\chapter}{0pt}{-25pt}{15pt}

% Changing the numbering of the sections
\renewcommand{\thesection}{\thechapter.\number\numexpr\value{section}\relax}

% Linefeed in cells
\newcommand{\specialcell}[2][c]{%
  \begin{tabular}[#1]{@{}l@{}}#2\end{tabular}}

\hypersetup{colorlinks=true, linkcolor=black, ,urlcolor=black}

\newcommand{\nocontentsline}[3]{}
\newcommand{\tocless}[2]{\bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup}


\DefineBibliographyStrings{ngerman}{%
  urlseen = {Zuletzt abgerufen:}
}

\pgfkeys{/mypkg/.is family, /mypkg,
  default/.style = {first={\first}, second={\second}},
  first/.store in = \first,
  second/.store in = \second
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Sub-Commands %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Name: createtitle
%
% Description: Prints the given title in a proper formatted way.
%
% Paramter 1: Type of paper.
%
% Paramter 2: Title of the paper.
\newcommand{\createtitle}[2]{\title{
	 {\bfseries #1}\\#2}
}

% Name: createauthor
%
% Description: Prints the given author in a proper formatted way.
%
% Paramter 1: Name of the author.
%
% Paramter 2: Mail-address of the author.
%
% Paramter 3: Degree program or anything similar.
\newcommand{\createauthor}[3]
{
			\author{\it #1\\
				\href{mailto: #2}
			{#2} \\
			#3
			}
		\pagenumbering{gobble}
		{\let\newpage\relax\maketitle}
}

\newcommand{\proclamationlang}{Proclamation}
\newcommand{\bibliographyname}{Bibliography}
\newcommand{\acronymname}{Acronyms}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Commands %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Name: setlanguagetogerman
%
% Description: Sets the current language to "german". This affects all header-toc elements. 
% Without the usage of this command, the default language is "english".
\newcommand{\setlanguagetogerman}
{
    \addto\captionsenglish{
      \renewcommand{\contentsname}
        {Inhaltsverzeichnis}
    }
    
    \addto\captionsenglish{
      \renewcommand{\lstlistingname}
        {Code}
    }
    
    \addto\captionsenglish{
      \renewcommand{\labelenumi}
        {enumi}
    }
    
    \addto\captionsenglish{
      \renewcommand{\lstlistlistingname}
        {Quelltextverzeichnis}
    }
    
    \addto\captionsenglish{
      \renewcommand{\listtablename}
        {Tabellenverzeichnis}
    }
    
    \addto\captionsenglish{
      \renewcommand{\listfigurename}
        {Abbildungsverzeichnis}
    }
    
    \addto\captionsenglish{
      \renewcommand{\appendixtocname}
        {Anhang}
    }
    
    \addto\captionsenglish{
      \renewcommand{\appendixpagename}
        {Anhang}
    }
    
    \addto\captionsenglish{
      \renewcommand{\appendixname}
        {Anhang}
    }
    
    \addto\captionsenglish{
      \renewcommand{\proclamationlang}
        {Erklärung}
    }
    
    \addto\captionsenglish{
      \renewcommand{\figurename}
        {Abbildung}
    }
    
    \addto\captionsenglish{
      \renewcommand{\tablename}
        {Tabelle}
    }
    
     \addto\captionsenglish{
      \renewcommand{\bibliographyname}
        {Literaturverzeichnis}
    }
    
    \renewcommand{\acronymname}{Akürzungsverzeichnis}
}

% Name: createtitlepage
%
% Description: This command creates the titlepage of the paper itself in a certain formatting. It
% includes: type of paper, title, author, mail-address, date, image, institute name, corresponding
% persons.
%
% Paramter 1: Type of paper.
%
% Paramter 2: Title of the paper.
%
% Paramter 3: Name of the author.
%
% Paramter 4: Mail-address of the author.
%
% Paramter 5: Degree program or anything similar.
%
% Paramter 6: Logo of the institute.
%
% Paramter 7: Scalling of the recent logo.
%
% Paramter 8: Institute name etc.
%
% Paramter 9: Corresponding persons (supervising professor etc.)
\newcommand{\createtitlepage}[9]
{
	\createtitle{#1}{#2}
	\createauthor{#3}{#4}{#5}
	\insertimgnocap{#6}{#7}
	\centering #8 
	 \par
	 
	 \begin{center}
        \begin{tabular}{r l}
        	 		#9
        		\end{tabular}
    \end{center}
	     \vfill
}

% Name: insertimg
%
% Description: Inserts the given image at the current text-position.
%
% Paramter 1: The path to the image.
%
% Paramter 2: Scalling of the given image.
%
% Paramter 3: Caption of the given image.
\newcommand{\insertimg}[3]
{
    \begin{figure}[H]
        \centering
	     \includegraphics[scale=#2]{#1}
	     \caption{#3}
        \label{fig:#1}
    \end{figure}
}

% Name: insertimgnocap
%
% Description: Inserts the given image at the current text-position. This image-insertion has no 
% caption but is listed in the list of figures.
%
% Paramter 1: The path to the image.
%
% Paramter 2: Scalling of the given image.
%
% Paramter 3: Caption of the given image.
\newcommand{\insertimgnocap}[2]
{
    \begin{figure}[H]
        \centering
	     \includegraphics[scale=#2]{#1}
        \label{fig:#1}
    \end{figure}
}

% Name: proclamation
%
% Description: This environment creates a proclamation with the main text and a secondary text, 
% respectively content area.
%
% Paramter 1: Sub-text-area.
%
% Paramter 2: Sub-Sub-text-area.
\newenvironment{proclamation}[2]
{
    \pgfkeys{/mypkg/.cd, first, #1}
    \pgfkeys{/mypkg/.cd, second, #2}
    \addcontentsline{toc}{chapter}{\proclamationlang}
	 \chapter*{\proclamationlang}
}
{
    \vspace{3cm}
    \hrule
    \vspace{0.1cm}
    \first \hspace{5cm} \second
	 \newpage
}

% Name: acron
%
% Description: Creates an environment for the acronym listings.
%
% Paramter 1: Sub-text-area.
%
% Paramter 2: Sub-Sub-text-area.
\newenvironment{acron}
{
    \addcontentsline{toc}{chapter}{\acronymname}
	\vspace*{1px}
	\lhead{\acronymname}
	{\huge \textbf{\acronymname}}
	\\
	\begin{acronym}[AAAA]
}
{
    \end{acronym}
  	\newpage  
}

% Name: startintro
%
% Description: Changes the outline to a format, were the "chapter" is not listed in the header.
\newcommand{\startintro}
{
   \setlength\bibitemsep{0.5\baselineskip}
	\pagestyle{plain}
}

% Name: startintro
%
% Description: Changes the outline to a format, were the "chapter" is listed int the header. The 
% pagenumber has the arabic notation.
\newcommand{\startthesiscontent}
{
   \fancyhead[RE,LO]{\leftmark}
	\pagenumbering{arabic}
}

% Name: printbib
%
% Description: Prints the bibliography at the current position with all recently mentioned 
% references.
\newcommand{\printbib}
{
	\newpage
	\sloppy
	\addcontentsline{toc}{chapter}{\contentsname}
	\printbibliography
	\newpage
	\setlength\bibitemsep{0.5\baselineskip}
}

% Name: newchapter
%
% Description: Creates a new chapter header and also adds the name to the TOC and the headnote.
\newcommand{\newchapter}[1]
{
	\addcontentsline{toc}{chapter}{#1}
	\chapter*{#1}
}

% Name: newtoc
%
% Description: Prints the TOC at the current position.
\newcommand{\newtoc}
{
	\tableofcontents
	\addcontentsline{toc}{chapter}{\contentsname}
	\newpage	
}

% Name: newlof
%
% Description: Prints the LOF at the current position.
\newcommand{\newlof}
{
	\addcontentsline{toc}{chapter}{\listfigurename}
	\listoffigures
	\newpage
}

% Name: newlot
%
% Description: Prints the LOT at the current position.
\newcommand{\newlot}
{
	\addcontentsline{toc}{chapter}{\listtablename}
	\listoftables 
	\newpage
}

% Name: newbib
%
% Description: Prints the bibliography at the current position.
\newcommand{\newbib}
{
	\newpage		
	\sloppy
	\addcontentsline{toc}{chapter}{\bibliographyname}
	\printbibliography[title=\bibliographyname]
}

\endinput
