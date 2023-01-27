#Author: Ganesh Prabhakaran
Feature: PUT: Scenarios related to PUT requests

  @putAPC
  Scenario Outline: PUT: Test the "api.reliefweb.com"
    Given I want to set URL as "<EndPoint>" with "<URL>" for test case "<TestName>"
    When I set header content type as "<ContentType>"
    When I hit the API with requestbody "<RequestBody>" and request method is "<RequestMethod>"
    Then I try to verify the status code is "<StatusCode>"
    And I try to verify the response value "count" is "12"

    Examples:
      | TestName         | EndPoint        | URL        | ContentType      | RequestBody | RequestMethod | StatusCode |
      | api.reliefweb test | reliefwebEndpoint | /reports?appname=apidoc | application/json |    testdata/reliefwebPutreqFormat.json         | PUT           | 200        |