#Author: Ganesh Prabhakaran
Feature: API test scripts (Negative Scenarios)

  @negativeAPCscenario
  Scenario Outline: GET: Test the "basecamp.com" (Negative scenario when a user does not have access to the site, user should not be able to access and response code 404 should be returned)
    Given I want to set URL as "<EndPoint>" with "<URL>" for test case "<TestName>"
    When I set header content type as "<ContentType>"
    When I hit the API with requestbody "<RequestBody>" and request method is "<RequestMethod>"
    Then I try to verify the status code is "<StatusCode>"

    Examples:
      | TestName          | EndPoint         | URL                    | ContentType      | RequestBody | RequestMethod | StatusCode |
      | basecamp.com test | baseCampEndpoint | /projects/1/todos.json | application/json |             | GET           | 404        |

  @negativeAPCscenario
  Scenario Outline: POST: Test the "openchargemap.org" (When user does not have authentication key to perform a POST request, then response with 403 error code should be displayed)
    Given I want to set URL as "<EndPoint>" with "<URL>" for test case "<TestName>"
    When I set header content type as "<ContentType>"
    When I hit the API with requestbody "<RequestBody>" and request method is "<RequestMethod>"
    Then I try to verify the status code is "<StatusCode>"

    Examples:
      | TestName         | EndPoint        | URL        | ContentType      | RequestBody | RequestMethod | StatusCode |
      | openchargemap.org test | openchargemapEndpoint | /?action=comment_submission&format=json | application/json |    testdata/openChargeMapreqFormat.json         | POST           | 403        |