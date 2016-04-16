Features: Insert statistical graphics configuration into axis

    Background:
        Given Build stage covering the build of Tikz section in Latex document
        When Axis contains \addplot settings
        Then Initiate building of axis parameters

    Scenario: Axis contains arguments, which are added
        Given Axis contains arguments
        When Arguments are loaded
        Then Building of arguments, with appropriate templating

    Scenario: Axis contains an unprocessed plot parameter
        Given Axis contains \addplot request
        When Relevant \addplot is sourced
        Then Building of arguments, with appropriate templating

    Scenario: Axis contains no more plot parameters to be processed
        Given Axis is being built
        When Axis contains no more \addplot requests
        Then Axis build is complete, including with relevant templating
