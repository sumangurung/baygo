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

  Scenario: View tasks in four quadrants
    Given I have tasks in different quadrants
    When I visit the tasks page
    Then I should be able to see the tasks under their respective quadrants 
