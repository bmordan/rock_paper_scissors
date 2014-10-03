Feature: The player has to enter their name
  In order to let off steam
  As a marketeer
  I want to play a game of Rock,paper,sissors

  Scenario:
    Given I have arrived at the "home" page
    When I enter my "name" in the emtpy "field"
    Then I see the question "Choose"

  Scenario:
    Given I have arrived at the "home" page
    When I do not enter a name in the field
    Then I see a prompt to "Enter your Name"

  Scenario:
    Given I have entered a name
    When I arrive at the start page
    Then I can choose to play a "person" or my "phone"