@javascript
Feature: New word page
  Background:
    Given signed in user

  Scenario: Creation of a new word
    When I am on the home page
    And I fill in "search_word" with "parrot"
    And I submit the form
    Then I should be on the new word page
    And I should see "попугай"
    And I press "Add category"
    And I fill in "category_0" with "animals"
    And I press "Create User word"
    Then I should be on the "parrot" word's page
