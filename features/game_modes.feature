Feature: The player chooses an opponent
  In order to always be able to play
  As someone who might play alone
  I want to choose a game mode

  Scenario:
    Given I have a friend wanting to play with me
    When I have entered my name I click on "Human"
    Then I see the message "Waiting for another player..."