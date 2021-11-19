@LoginFeature
Feature: Login Feature

  Background: Open Login Page
    Given User has navigated to the login page

  @Regression @Sanity
  Scenario: Positive Login Scenario
    When User enters correct username and password
    And User clicks on the Login Button
    Then User Should be navigated to the Home Page
	@Regression
  Scenario: Positive Login Scenario with Parameters
    When User enters correct username "abcd@gmail.com" and password "abCd123@gmail.com"
    And User clicks on the Login Button
    Then User Should be navigated to the Home Page

  Scenario Outline: Positive Login Scenario with multiple users
    When User enters correct username "<UserName>" and password "<Password>"
    And User clicks on the Login Button
    Then User Should be navigated to the Home Page

    Examples: 
      | UserName       | Password  |
      | abcd@gmail.com | Abcd123@@ |
      | fcdf@gmail.com | asDf123@@ |

  Scenario Outline: Negetive Login Scenario with multiple users
    When User enters correct username "<UserName>" and password "<Password>"
    And User clicks on the Login Button
    Then User Should be getting error "<error>"

    Examples: 
      | UserName       | Password  | error                                              |
      | abcd@gmail.com | Abcd123@@ | The email or password you have entered is invalid. |
      | fcdf@gmail.com | asDf123@@ | The email or password you have entered is invalid. |

  @DataTable
  Scenario: Positive Login Scenario with Cucumber data table
    When User enters correct credentials
      | Field    | Value             |
      | UserName | abcd232@gmail.com |
      | Password | Abcf123@@         |
    And User clicks on the Login Button
    Then User Should be navigated to the Home Page
