Feature: PGFPlot settings introduced to a Latex document

Background: A constructor function has identified that a setting relating to PGFplots needs to be placed before or after parts of the latex document

@latex @pgfplots @settings @building @content @insert @referencing @sequence
Scenario: PGFPlots settings need to go before specific content
    Given Need for PGFPlots setting flagged up
    When The relevant PGFPlots setting is referenced
    Then PGFPlots settings inserted with appropriate templating
    And The document building continues

@latex @pgfplots @settings @building @content @append @referencing @sequence
Scenario: PGFPlots settings need to go after specific content
    Given Need for PGFPlots setting flagged up
    When The document build pauses after finishing section
    Then The relevant PGFPlots setting is referenced
    And PGFPlots settings appended with appropriate templating
    And Regular document building continues
