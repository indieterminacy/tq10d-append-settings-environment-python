Feature: Generate macros for Tex compatible environments

Background: Build section has reached point where Tex macros are sourced and built into document

        Example:
\makeatletter
\def\pgfplots@drawaxis@outerlines@separate@onorientedsurf#1#2{%
    \if2\csname pgfplots@#1axislinesnum\endcsname
        % centered axis lines handled elsewhere.
    \else
    \scope[/pgfplots/every outer #1 axis line,
        #1discont,decoration={pre length=\csname #1disstart\endcsname, post length=\csname #1disend\endcsname}]
        \pgfplots@ifaxisline@B@onorientedsurf@should@be@drawn{0}{%
            \draw [/pgfplots/every first #1 axis line] decorate {
                \pgfextra
                % exchange roles of A <-> B axes:
                \pgfplotspointonorientedsurfaceabsetupfor{#2}{#1}{\pgfplotspointonorientedsurfaceN}%
                \pgfplots@drawgridlines@onorientedsurf@fromto{\csname pgfplots@#2min\endcsname}%
                \endpgfextra
                };
        }{}%
        \pgfplots@ifaxisline@B@onorientedsurf@should@be@drawn{1}{%
            \draw [/pgfplots/every second #1 axis line] decorate {
                \pgfextra
                % exchange roles of A <-> B axes:
                \pgfplotspointonorientedsurfaceabsetupfor{#2}{#1}{\pgfplotspointonorientedsurfaceN}%
                \pgfplots@drawgridlines@onorientedsurf@fromto{\csname pgfplots@#2max\endcsname}%
                \endpgfextra
                };
        }{}%
    \endscope
    \fi
}%
\makeatother

    Scenario: Identify all macros that are relevant to document
        Given Macros list is already activated
        When Macros are appended to list with appropriate order
        Then Macro list is built into document with appropriate templating

    Scenario: Macro to be appended is flagged with makeat{letter,other}
        Given Macro is to be appended
        When Macro is flagged with makeat{letter, other}
        Then Macro uses alternative function to include correct templating
