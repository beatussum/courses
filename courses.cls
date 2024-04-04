%% courses.cls
%% Copyright 2024 Mattéo Rossillol‑‑Laruelle.
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Mattéo Rossillol‑‑Laruelle.
%
% This work consists of the file courses.cls.
%
% This file is largely inspired by the work of Pierre Poinas, a student at
% ENSIMAG from 2022 to 2025.

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{courses}[My LaTeX class for courses at ENSIMAG]

\LoadClass[a4paper]{article}

% Font configuration

\RequirePackage{fontspec}
\RequirePackage{mathtools} % need to be loaded before `unicode-math`
\RequirePackage[math-style = french, bold-style = ISO]{unicode-math}

\setmathfont{NewCMMath-Regular.otf}

% Main packages

\RequirePackage[french, strings = unicode]{babel} % localization
\RequirePackage{csquotes} % for `\enquote` command
\RequirePackage[useregional]{datetime2} % better date formatting
\RequirePackage{fancyhdr} % better header
\RequirePackage{icomma} % fix comma space

\RequirePackage[
    top = 2cm,
    bottom = 2cm,
    left = 2cm,
    right = 2cm,
    headheight = 18pt
]{geometry}

\RequirePackage[hidelinks]{hyperref}
\RequirePackage[most]{tcolorbox}
\RequirePackage{titlesec}
\RequirePackage{tocloft} % for spacing in TOC
\RequirePackage[svgnames, table]{xcolor}

% Additionnal packages

\RequirePackage{amsmath}
\RequirePackage{enumitem} % better `enumerate`, `itemize`, etc.
\RequirePackage{listing}
\RequirePackage{multicol}
\RequirePackage{nicefrac}
\RequirePackage[arrowdel]{physics}
\RequirePackage{siunitx} % for SI units
\RequirePackage{stmaryrd}
\RequirePackage{tikz} % for drawing

% Some command overrides

\renewcommand{\maketitle}{
    \makeatletter

    \pagestyle{fancy}
    \fancyhead[L]{R.--L. Mattéo}
    \fancyhead[C]{\@title}
    \fancyhead[R]{ENSIMAG 1A}

    \begin{center}
\color{Navy} \fontsize{35pt}{12pt} \textbf{\@title} \\
\vspace{10pt}
\color{Black} \fontsize{18pt}{12pt} \textbf{\@author}
    \end{center}

    \makeatother

    \newpage
    \tableofcontents
    \newpage
}

%% Section headers

\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\arabic{subsection}}
\renewcommand{\thesubsubsection}{\alph{subsubsection}}

% New commands

\newcommand{\mydef}[1]{\textcolor{red}{\text{#1}}}
\newcommand{\myimp}[1]{\textcolor{teal}{\text{#1}}}

\newcommand{\newday}[1]{Début du cours du \textcolor{teal}{\DTMdate{#1}}.}

\newcommand{\myand}{\text{ et }}

%% Bitwise operators

\newcommand{\notb}{\overline}
\newcommand{\xor}{\oplus}

\newcommand{\xnor}{\notb{\oplus}}
\newcommand{\nand}{\notb{\cdot}}
\newcommand{\nor}{\notb{+}}

% `mathtools`

\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\iinterval}{\llbracket}{\rrbracket}

% Some `tcolorbox` definitions

\tcbset{
    before upper = {\tcbtitle\quad},
    coltitle = black,
    detach title,
    enhanced,
    fonttitle = \bfseries,
    frame hidden
}

\newtcolorbox{corollary}{
    borderline west = {4pt}{-5pt}{purple, line cap = round},
    title = \underline{Corollaire :}
}

\newtcolorbox{definition}{
    borderline west = {4pt}{-5pt}{red, line cap = round},
    title = \underline{Définition :}
}

\newtcolorbox{lemma}{
    borderline west = {4pt}{-5pt}{purple, line cap = round},
    title = \underline{Lemme :}
}

\newtcolorbox{method}{
    borderline west = {4pt}{-5pt}{blue, line cap = round},
    title = \underline{Méthode :}
}

\newtcolorbox{proposal}{
    borderline west = {4pt}{-5pt}{green, line cap = round},
    title = \underline{Proposition :}
}

\newtcolorbox{remark}{
    borderline west = {4pt}{-5pt}{orange, line cap = round},
    title = \underline{Remarque :}
}

\newtcolorbox{theorem}{
    borderline west = {4pt}{-5pt}{magenta, line cap = round},
    title = \underline{Théorème :}
}

%% `*example` `tcolorbox`es

\newtcolorbox{dexample}[1]{
    borderline west = {4pt}{-5pt}{black, line cap = round},
    lefthand ratio = #1,
    sidebyside,
    sidebyside align = top seam,
    title = \underline{Exemple :}
}

\newtcolorbox{example}{
    borderline west = {4pt}{-5pt}{black, line cap = round},
    title = \underline{Exemple :}
}

% Other package setups

\setlist[itemize]{label = \bullet}

\lstset{
    commentstyle = \color{teal},
    keywordstyle = \color{magenta},
    numberstyle = \tiny\color{gray},
    stringstyle = \color{purple},
    basicstyle = \tiny,
    breakatwhitespace = false,
    breaklines = true,
    captionpos = b,
    extendedchars = true,
    keepspaces = true,
    numbers = left,
    numbersep = 5pt,
    showspaces = false,
    showstringspaces = false,
    showtabs = false,
    tabsize = 4,
    xleftmargin = 0.5cm
}

\sisetup{
    locale = FR,
    group-digits = integer,
    group-minimum-digits = 3,
    input-complex-root,
    list-units = single,
    per-mode = power-positive-first,
    range-units = single,
    retain-explicit-plus,
    separate-uncertainty,
    separate-uncertainty-units = single,
    table-alignment-mode = format,
    table-auto-round,
    uncertainty-mode = separate
}

% General setup

\cftsetindents{section}{1em}{3em}
\author{ROSSILLOL‑‑LARUELLE Mattéo}
