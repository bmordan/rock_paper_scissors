Feature: The player chooses an opponent
  In order to always be able to play
  As someone who might play alone
  I want to choose a game mode

  Scenario:
    Given I have a friend wanting to play with me
    When I have entered my name I click on friends
    Then I see the message "Waiting for another player..."

  Scenario:
    Given my friends are not around
    When I have entered my name "Amy" I click on robot
    Then I see the message "OK Amy you are playing Robot"

  Scenario:
    Given I am playing a robot
    When I choose an option
    Then I see the results page

  Scenario:
    Given I have finished playing
    When I choose to leave the game
    Then I get to start again

  Scenario:
    Given I want to play again  
    When I reset
    Then I get to play again
   