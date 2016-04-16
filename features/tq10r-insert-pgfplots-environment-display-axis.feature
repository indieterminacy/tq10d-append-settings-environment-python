Feature: Insert statistical graphics configuration into axis

@latex @pgfplots @axis @building
    Background:
        Given Build stage covering the build of Tikz section in Latex document
        When Axis contains \addplot settings
        Then Initiate building of axis parameters

        Examples:
\begin{axis}[
            ylabel=Total Opens,
            axis y line*=left,%
            first y axis line style=blue,%
            fill opacity=0.5,%
    ]
    \addplot[%
            blue,%
            name path=A,%
            domain=1:28,%
        enlarge x limits=false,%
    ] table[%
        x=Group,%
        y=sum%
    ] from {\interestgroups};
    \addplot[%
        name path=B,%
        domain=1:28,%
        samples=2%
    ] {0.5};
    \addplot[%
        pattern=crosshatch,%
        pattern color=orange!80!white%
    ] fill between[%
        of=A and B,soft clip={domain=1:11}%
    ];
    \addplot[%
        pattern=crosshatch,%
        pattern color=blue!20!white%
    ] fill between[%
        of=A and B,soft clip={domain=11:14}%
    ];
    \addplot[%
        pattern=crosshatch,%
        pattern color=blue!60!white%
    ] fill between[%
        of=A and B,soft clip={domain=14:17}%
    ];
    \addplot[%
        pattern=crosshatch,%
        pattern color=blue!40!white%
    ] fill between[%
        of=A and B,soft clip={domain=17:21}%
    ];
    \addplot[%
        pattern=crosshatch,%
        pattern color=blue!80!white%
    ] fill between[%
        of=A and B,soft clip={domain=21:28}%
    ];
\end{axis}
\begin{axis}[
        axis on top,
        second y axis line style=red,
        axis y line*=right,
        axis x line=none,
        ylabel=Participants
    ]
        \addplot [
            red%
        ] table[%
            x=Group,%
            y=len%
        ]
        from \interestgroups;
\end{axis}

@arguments
    Scenario: Axis contains arguments, which are added
        Given Axis contains arguments
        When Arguments are loaded
        Then Building of arguments, with appropriate templating

    @unprocessed @plots @append
    Scenario: Axis contains an unprocessed plot parameter
        Given Axis contains \addplot request
        When Relevant \addplot is sourced
        Then Building of arguments, with appropriate templating

    @allprocessed @plots @append
    Scenario: Axis contains no more plot parameters to be processed
        Given Axis is being built
        When Axis contains no more \addplot requests
        Then Axis build is complete, including with relevant templating
