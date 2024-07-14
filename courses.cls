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

% Packages

%% Font configuration

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}

%% i18n packages

\RequirePackage[french, strings = unicode]{babel}
\RequirePackage{fvextra} % needed to be loaded before `csquotes`
\RequirePackage{csquotes} % for `\enquote` command
\RequirePackage[useregional]{datetime2} % better date formatting
\RequirePackage{icomma} % fix comma space

%% Packages for maths and physics

\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{nicefrac}
\RequirePackage[arrowdel]{physics}
\RequirePackage{siunitx} % for SI units
\RequirePackage{stmaryrd}

%% Main packages

\RequirePackage{fancyhdr} % better header

\RequirePackage[
    top = 2cm,
    bottom = 2cm,
    left = 2cm,
    right = 2cm,
    headheight = 18pt
]{geometry}

\RequirePackage[hidelinks]{hyperref}
\RequirePackage{cleveref}
\RequirePackage[most]{tcolorbox}
\RequirePackage{titlesec}
\RequirePackage{tocloft} % for spacing in TOC

%% `tabular` packages

\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{tabularx}

%% Drawing packages

\RequirePackage{svg}
\RequirePackage{tikz}
\RequirePackage[svgnames, table]{xcolor}

%% Additionnal packages

\RequirePackage{enumitem} % better `enumerate`, `itemize`, etc.

% Some command overrides

\AtBeginDocument{\RenewCommandCopy\qty\SI} % conflict with `physics`

\renewcommand{\maketitle}{
    \makeatletter

    \pagestyle{fancy}
    \fancyhead[L]{Mattéo R.-{}-L.}
    \fancyhead[C]{\@title}
    \fancyhead[R]{ENSIMAG 2A --- ISI}

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

\renewcommand{\arraystretch}{1.5}

%% Patch cleveref

%%% See https://tex.stackexchange.com/a/670393.

\makeatletter
\patchcmd\@cref{\begingroup}{\begingroup\@safe@activestrue}{}{\fail}
\patchcmd\@cref{\cref@isstackfull{\@refsubstack}}{\cref@isstackfull{\@refsubstack}\@safe@activesfalse}{}{\fail}
\makeatother

%% Section headers

\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\arabic{subsection}}
\renewcommand{\thesubsubsection}{\alph{subsubsection}}

% New commands

\newcommand{\mydef}[1]{\textcolor{red}{\text{#1}}}
\newcommand{\myimp}[1]{\textcolor{teal}{\text{#1}}}

\newcommand{\newday}[1]{Début du cours du \textcolor{teal}{\DTMdate{#1}}.}

\newcommand{\myand}{\text{ et }}
\newcommand{\myor}{\text{ ou }}

%% Bitwise operators

\newcommand{\notb}{\overline}
\newcommand{\xor}{\oplus}

\newcommand{\xnor}{\notb{\oplus}}
\newcommand{\nand}{\notb{\cdot}}
\newcommand{\nor}{\notb{+}}

% `amsmath`

\DeclareMathOperator{\naturalset}{\mathbb{N}}
\DeclareMathOperator{\realset}{\mathbb{R}}

% `mathtools`

\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\iinterval}{\llbracket}{\rrbracket}

% Some `tcolorbox` definitions

%% Styles

\tcbset{
    new/counted/.style = {
        auto counter,
        number within = subsubsection,
        number freestyle = {\noexpand\thesection.\noexpand\thesubsection.\noexpand\thesubsubsection-\noexpand\arabic{\tcbcounter}},
    }
}

\tcbset{
    box/.style = {
        colback = blue!5,
        colbacktitle = blue!10,
        coltitle = black,
        enhanced,
        fonttitle = \bfseries,
        frame hidden
    }
}

\tcbset{
    tab/.style = {
        enhanced,
        fonttitle = \bfseries,
        fontupper = \normalsize \sffamily,
        colback = white!10!white,
        colframe = red!50!black,
        colbacktitle = Salmon!40!white,
        coltitle = black,
        center title
    }
}

%% Environments

\newtcolorbox{mytabular}[2]{
    tab,
    tabularx = {#1},
    #2
}

%%% `box`es

\newtcbtheorem[
    counted,
    crefname = {corollaire}{corollaires}
]{corollary}{Corollaire}{
    box,
    borderline west = {4pt}{-5pt}{purple, line cap = round}
}{clry}

\newtcbtheorem[
    counted,
    crefname = {définition}{définitions}
]{definition}{Définition}{
    box,
    borderline west = {4pt}{-5pt}{red, line cap = round}
}{def}

\newtcbtheorem[
    counted,
    crefname = {lemme}{lemmes}
]{lemma}{Lemme}{
    box,
    borderline west = {4pt}{-5pt}{purple, line cap = round}
}{lem}

\newtcbtheorem[
    counted,
    crefname = {méthode}{méthodes}
]{method}{Méthode}{
    box,
    borderline west = {4pt}{-5pt}{blue, line cap = round}
}{meth}

\newtcbtheorem[
    counted,
    crefname = {proposition}{propositions}
]{proposal}{Proposition}{
    box,
    borderline west = {4pt}{-5pt}{green, line cap = round}
}{prop}

\newtcbtheorem[
    counted,
    crefname = {remarque}{remarques}
]{remark}{Remarque}{
    box,
    borderline west = {4pt}{-5pt}{orange, line cap = round}
}{rmk}

\newtcolorbox{reminder}[1][]{
    box,
    borderline west = {4pt}{-5pt}{orange, line cap = round},
    title = \underline{Rappel :},
    #1
}

\newtcbtheorem[
    counted,
    crefname = {point syntaxique}{points syntaxiques}
]{syntax}{Point syntaxique}{
    box,
    borderline west = {4pt}{-5pt}{OrangeRed, line cap = round}
}{stx}

\newtcbtheorem[
    counted,
    crefname = {théorèmes}{théorèmes}
]{theorem}{Théorème}{
    box,
    borderline west = {4pt}{-5pt}{magenta, line cap = round}
}{the}

%%%% `*example` `tcolorbox`es

\newtcolorbox{dexample}[2][]{
    box,
    borderline west = {4pt}{-5pt}{black, line cap = round},
    lefthand ratio = #2,
    sidebyside,
    sidebyside align = top seam,
    title = {Exemple :},
    #1
}

\newtcolorbox{example}[1][]{
    box,
    borderline west = {4pt}{-5pt}{black, line cap = round},
    title = {Exemple :},
    #1
}

% Other package setups

\setlist[itemize]{label = \( \bullet \)}

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
\author{Mattéo ROSSILLOL‑{}‑LARUELLE}
