#Author: Ganesh Prabhakaran
Feature: GET: Scenarios related to GET requests

  @getAPC
  Scenario Outline: GET: Test the "imgflip.com"
    Given I want to set URL as "<EndPoint>" with "<URL>" for test case "<TestName>"
    When I set header content type as "<ContentType>"
    When I hit the API with requestbody "<RequestBody>" and request method is "<RequestMethod>"
    Then I try to verify the status code is "<StatusCode>"
    And I try to verify the response value "success" is "true"

    Examples:
      | TestName         | EndPoint        | URL        | ContentType      | RequestBody | RequestMethod | StatusCode |
      | imgflip.com test | imgflipEndpoint | /get_memes | application/json |             | GET           | 200        |

  @getAPC
  Scenario Outline: GET: Test the "dog.ceo"
    Given I want to set URL as "<EndPoint>" with "<URL>" for test case "<TestName>"
    When I set header content type as "<ContentType>"
    When I hit the API with requestbody "<RequestBody>" and request method is "<RequestMethod>"
    Then I try to verify the status code is "<StatusCode>"
    And I try to verify the response value "status" is "success"

    Examples:
      | TestName     | EndPoint         | URL           | ContentType      | RequestBody | RequestMethod | StatusCode |
      | dog.ceo test | dogbreedEndpoint | /image/random | application/json |             | GET           | 200        |

  @getAPC
  Scenario Outline: GET: Test the "lolwallpapers.docs.apiary.io"
    Given I want to set URL as "<EndPoint>" with "<URL>" for test case "<TestName>"
    When I set header content type as "<ContentType>"
    When I hit the API with requestbody "<RequestBody>" and request method is "<RequestMethod>"
    Then I try to verify the status code is "<StatusCode>"

    Examples:
      | TestName                          | EndPoint           | URL                       | ContentType      | RequestBody | RequestMethod | StatusCode |
      | lolwallpapers.docs.apiary.io test | wallpapersEndpoint | /alpha/wallpapers?limit=2 | application/json |             | GET           | 200        |
