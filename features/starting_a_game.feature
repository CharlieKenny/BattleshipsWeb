Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Navigating
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"
    
  Scenario: Game creation
    Given I am on the submitpage 
    When I fill in "name" with "Charlie"
    And I click "Submit"
    Then I should see "Welcome: Charlie"
    
  Scenario: Game initialisation
    Given I am on the newgamepage
    When I submit my coordinates and boat orientation
    Then I can see my boat on the board

    





