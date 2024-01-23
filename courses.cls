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
\RequirePackage[svgnames, table]{xcolor}

% Additionnal packages

\RequirePackage{enumitem} % better `enumerate`, `itemize`, etc.
\RequirePackage{forest} % for tree
\RequirePackage{multicol}
\RequirePackage{nicefrac}
\RequirePackage[arrowdel]{physics}
\RequirePackage{siunitx} % for SI units
\RequirePackage{tikz} % for automata

%% AMS packages

\RequirePackage{amsmath}
\RequirePackage{amssymb}

% Font configuration

\RequirePackage{fontspec}
\RequirePackage[math-style = french, bold-style = ISO]{unicode-math}

% New commands

\newcommand{\mydef}[1]{\textcolor{red}{#1}}
\newcommand{\myimp}[1]{\textcolor{teal}{#1}}
\newcommand{\xor}{\oplus}

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
}

%% Section headers

\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{Cours \arabic{subsection}}
\renewcommand{\thesubsubsection}{\alph{subsubsection}}

% Some `tcolorbox` definitions

\newtcolorbox{definition}{
    before upper = {\tcbtitle\quad},
    borderline west = {4pt}{-5pt}{green, line cap = round},
    coltitle = black,
    detach title,
    enhanced,
    fonttitle = \bfseries,
    frame hidden,
    title = \underline{Définition :}
}

\newtcolorbox{method}{
    before upper = {\tcbtitle\quad},
    borderline west = {4pt}{-5pt}{blue, line cap = round},
    coltitle = black,
    detach title,
    enhanced,
    fonttitle = \bfseries,
    frame hidden,
    title = \underline{Méthode :}
}

\newtcolorbox{proposal}{
    before upper = {\tcbtitle\quad},
    borderline west = {4pt}{-5pt}{red, line cap = round},
    coltitle = black,
    detach title,
    enhanced,
    fonttitle = \bfseries,
    frame hidden,
    title = \underline{Proposition :}
}

%% `*example` `tcolorbox`es

\newtcolorbox{dexample}[1]{
    before upper = {\tcbtitle\quad},
    borderline west = {4pt}{-5pt}{black, line cap = round},
    coltitle = black,
    detach title,
    enhanced,
    fonttitle = \bfseries,
    frame hidden,
    lefthand ratio = #1,
    sidebyside,
    sidebyside align = top seam,
    title = \underline{Exemple :}
}

\newtcolorbox{example}{
    before upper = {\tcbtitle\quad},
    borderline west = {4pt}{-5pt}{black, line cap = round},
    breakable,
    coltitle = black,
    detach title,
    enhanced,
    fonttitle = \bfseries,
    frame hidden,
    title = \underline{Exemple :}
}

% Other package setups

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

\usetikzlibrary{automata, arrows.meta, positioning, shapes}

% General setup

\author{ROSSILLOL‑‑LARUELLE Mattéo}
