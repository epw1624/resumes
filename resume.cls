%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Vignesh Iyer                                 %
% MS CSE ASU                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2023/03/18 v0.1 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

% set document margins
\usepackage[left=0.5 in,top=0.4in,right=0.5in,bottom=0.4in]{geometry}
\usepackage[parfill]{parskip} % Remove paragraph indentation

\usepackage{keycommand}
\usepackage{xstring}
\usepackage{hyperref}
\usepackage{fontawesome5}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=black,
}

\newcommand{\linkWithIcon}[2]{%
    \href{#1}{#2 \scriptsize\faIcon{external-link-alt}}
}

% Load the fontspec package to set the font
\usepackage[scaled]{helvet} % Load the Helvetica font
\renewcommand\familydefault{\sfdefault} % Set the default font family to sans-serif
\usepackage[T1]{fontenc} % Use the T1 font encoding to ensure proper character rendering

\pagestyle{empty}

\def \separator {\textbf{\Large\textbullet}}

\newcommand\printNameTitle[1]{%
    \begingroup
    \hfill{\MakeUppercase{\Huge\bfseries #1}}\hfill
    \break
    \vspace{-0.5em}
    \hrule
    \endgroup
}

\newcommand{\printContactInformation}{%
  \vspace{-0.3em} % remove vertical space above
  \begin{center}
    \ifcommandkey{email}{%
        \email{\commandkey{email}}%
        \ifcommandkey{github}{ \separator\ }%
        {\ifcommandkey{linkedin}{ \separator\ }%
                {}}%
    }{}%
    \ifcommandkey{github}{%
        \githublink{\commandkey{github}}%
        \ifcommandkey{linkedin}{ \separator\ }%
            {}%
    }{}%
    \ifcommandkey{linkedin}{%
        \linkedinlink{\commandkey{linkedin}}%
    }{}%
  \end{center}
}

\newcommand{\email}[1]{\href{mailto:#1}{\faIcon{envelope} #1}}

\newcommand{\githublink}[1]{\href{https://github.com/#1}{\faIcon{github} #1}}
\newcommand{\linkedinlink}[1]{\href{https://www.linkedin.com/in/#1}{\faIcon{linkedin} #1}}

\newkeycommand{\introduction}[fullname,email,phone,github,linkedin]{
    \printNameTitle{\commandkey{fullname}}
    \printContactInformation
}

\newcommand{\summary}[1]{
    \textbf{\MakeUppercase{Summary}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
    #1
}

\newcommand{\education}{
    \textbf{\MakeUppercase{Education}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
}

\newkeycommand{\educationItem}[university,program,graduation,grade,coursework,awards]{
    {\bf \commandkey{program}} \hfill {Graduating \commandkey{graduation}} \\
    {\commandkey{university}} \hfill \ifcommandkey{grade}{\commandkey{grade}}{} \\ \\
    \ifcommandkey{coursework}{\textbf{Relevant coursework:} \commandkey{coursework}}{} \\
    \vspace{-1em}
}

\newcommand{\skills}{
    \textbf{\MakeUppercase{Technical skills}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
}

\newkeycommand{\skillItem}[category, skills]{
    {\bf \commandkey{category}:} {\commandkey{skills}}
}

\newenvironment{workSection}[1]{
  \textbf{\MakeUppercase{#1}}
  \vspace{0.2em}
  \hrule
  \vspace{-0.3em}
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{0em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

\newkeycommand{\experienceItem}[company, position, location, duration]{
    \textbf{\commandkey{company}, \commandkey{location}: \commandkey{position}} \hfill {\commandkey{duration}}
}

\newkeycommand{\customItem}[title, duration, keyHighlight]{
    \textbf{\commandkey{title}} \hfill {\commandkey{duration}} \\
    \ifcommandkey{keyHighlight}{\commandkey{keyHighlight}}{}
}