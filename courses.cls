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

\newif\if@drawing
\DeclareOption{drawing}{\@drawingtrue}

\newif\if@minted
\DeclareOption{minted}{\@mintedtrue}

\ProcessOptions

\LoadClass[a4paper]{article}

% Packages

%% Font configuration

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}

%% i18n packages

\RequirePackage[french, english]{babel}
\RequirePackage{fvextra} % needed to be loaded before `csquotes`
\RequirePackage[autostyle = true]{csquotes} % for `\enquote` command
\RequirePackage[useregional]{datetime2} % better date formatting
\RequirePackage{icomma} % fix comma space

%% Packages for maths and physics

\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{nicefrac}
\RequirePackage[arrowdel]{physics}
\RequirePackage{siunitx}
\RequirePackage{stmaryrd} % for some math operators

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
\RequirePackage[french]{cleveref}
\RequirePackage[most]{tcolorbox}
\RequirePackage{titlesec}
\RequirePackage{tocloft} % for spacing in TOC
\RequirePackage[svgnames, table]{xcolor}
\RequirePackage{xspace}

\RequirePackage[
    type = CC,
    modifier = by-sa,
    version = 4.0
]{doclicense} % need to be loaded after hyperref

%% `tabular` packages

\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{tabularx}

%% Additionnal packages

\RequirePackage{enumitem} % better `enumerate`, `itemize`, etc.

%% Conditionnal packages

\if@drawing
    \RequirePackage{svg}
    \RequirePackage{tikz}
\fi

\if@minted
    \RequirePackage{minted}

    % See https://tex.stackexchange.com/a/289068.
    \AtBeginEnvironment{minted}{\renewcommand{\fcolorbox}[4][]{#4}}
\fi

% Some command overrides

\renewcommand{\maketitle}{
    \selectlanguage{french}

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

    \vspace{\fill}
    \foreignlanguage{english}{\doclicenseThis}

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

\newcommand{\textdef}[1]{\textcolor{red}{\text{#1}}}
\newcommand{\textimp}[1]{\textcolor{teal}{\text{#1}}}

\newcommand{\newday}[1]{Début du cours du \textimp{\DTMdate{#1}}.}

\newcommand{\mathand}{\text{ et }}
\newcommand{\mathor}{\text{ ou }}

%% Bitwise operators

\newcommand{\mathnot}{\overline}
\newcommand{\mathxor}{\oplus}

\newcommand{\mathxnor}{\notb{\oplus}}
\newcommand{\mathnand}{\notb{\cdot}}
\newcommand{\mathnor}{\notb{+}}

% `amsmath`

\DeclareMathOperator{\integerset}{\mathbb{Z}}
\DeclareMathOperator{\naturalset}{\mathbb{N}}
\DeclareMathOperator{\realset}{\mathbb{R}}

% `mathtools`

\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\iinterval}{\llbracket}{\rrbracket}

% `tabularx`

\newcolumntype{Y}{>{\centering\arraybackslash}X}

% Some `tcolorbox` definitions

%% Styles

\makeatletter

\newcommand{\@section}[1]{%
    \ifnum\value{#1}>0%
        .\csname the#1\endcsname%
    \fi%
}

\newcommand{\tcbpath}{%
    \thesection%
    \@section{subsection}%
    \@section{subsubsection}%
    -\arabic{\tcbcounter}%
}

\makeatother

\tcbset{
    new/counted/.style = {
        auto counter,
        number within = subsubsection,
        number freestyle = {\noexpand\tcbpath}
    }
}

\tcbset{
    box/.style = {
        breakable,
        colback = blue!5,
        colbacktitle = blue!10,
        coltitle = black!80,
        enhanced,
        fonttitle = \bfseries,
        frame hidden,
        separator sign dash,
        attach boxed title to top left = {xshift = 3mm, yshift = -1mm}
    }
}

\tcbset{
    tab/.style = {
        breakable,
        center title,
        colback = white!10!white,
        colbacktitle = Salmon!40!white,
        colframe = red!50!black,
        coltitle = black,
        enhanced,
        fonttitle = \bfseries,
        fontupper = \normalsize \sffamily
    }
}

%% Environments

\newtcolorbox{tcbtabular}[2]{
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
    borderline west = {4pt}{-5pt}{Fuchsia, line cap = round}
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
    borderline west = {4pt}{-5pt}{DarkOrange, line cap = round}
}{rmk}

\newtcolorbox{reminder}[1][]{
    box,
    borderline west = {4pt}{-5pt}{orange, line cap = round},
    title = Rappel,
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
    title = {Exemple},
    #1
}

\newtcolorbox{example}[1][]{
    box,
    borderline west = {4pt}{-5pt}{black, line cap = round},
    title = {Exemple},
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

\cftsetindents{section}{1em}{3em} % increase spacing for sections in toc
\author{Mattéo ROSSILLOL-{}-LARUELLE}
