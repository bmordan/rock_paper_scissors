Feature: Human vs Human mode
  In order to play another Human
  As a player
  I want to start a game by choosing a gesture
  
  Scenario:
    Given I have decided on a gesture
    When  I click on "Spock"
    Then I goto the results page and see the result