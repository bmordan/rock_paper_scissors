Feature: The player has to enter their name
  In order to let off steam
  As a marketeer
  I want to play a game of Rock,paper,sissors

  Scenario:
    Given i have arrived at the "home" page
    When i enter my "name" in the empy "field"
    Then I see the question "Wait for another player?"