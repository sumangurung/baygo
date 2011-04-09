Feature: Manage tasks
  In order to efficiently execute my tasks
  As a user
  I want to be able to manage my tasks
  
  Scenario: Register new task
    Given I am on the new task page
    When I fill in "Title" with "title 1"
    And I fill in "Body" with "body 1"
    And I press "Save"
    Then I should see "title 1"
    And I should see "body 1"

  Scenario: Delete task
    Given the following tasks:
      |title|body|
      |title 1|body 1|
      |title 2|body 2|
      |title 3|body 3|
      |title 4|body 4|
    When I delete the 3rd task
    Then I should see the following tasks:
      |Title|Body|
      |title 1|body 1|
      |title 2|body 2|
      |title 4|body 4|
