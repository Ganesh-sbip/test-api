## APC Assignment

This framework is developed as a part of APC interview process (as an assignment) to demonstrate the automation of Rest API's using Cucumber framework and Java as the programming language.

## Key Objectives of the framework
  - Automation of RESTful api or webservices projects with Rest Assured
  - The framework also includes customised extent reports which displays the test execution results in detail along with the screenshots of the report captured and saved in "images" folder
    
The following HTTP requests `GET`, `POST` and `PUT` are used as a part of the scenarios. There are few negative scenarios also developed.
  
## Table of Contents

- [Preconditions](#Preconditions)
- [MAVEN_Dependencies](#MAVEN_Dependencies)
- [Extent report configuration](#Extent Report Configuration)
- [Add_features_and_respective_step_definitions](#Add_features_and_respective_step_definitions)
- [Report](#Report)


---

## Preconditions
```
- bash 
- Maven 
- Java 8
- Cucumber Eclipse plugin
```

## MAVEN_Dependencies
Add the following dependencies to your `pom.xml`
All below dependencies are compatible.

```maven
<dependency>
    <groupId>com.googlecode.json-simple</groupId>
    <artifactId>json-simple</artifactId>
    <version>1.1.1</version>
</dependency>
<!-- https://mvnrepository.com/artifact/io.rest-assured/rest-assured -->
<dependency>
    <groupId>io.rest-assured</groupId>
    <artifactId>rest-assured</artifactId>
    <scope>test</scope>
</dependency>
<!-- https://mvnrepository.com/artifact/com.relevantcodes/extentreports -->
<dependency>
    <groupId>com.relevantcodes</groupId>
    <artifactId>extentreports</artifactId>
    <version>2.41.2</version>
</dependency>
<!-- https://mvnrepository.com/artifact/com.vimalselvam/cucumber-extentsreport -->
<dependency>
    <groupId>com.vimalselvam</groupId>
    <artifactId>cucumber-extentsreport</artifactId>
    <version>3.0.2</version>
</dependency>
<!-- https://mvnrepository.com/artifact/info.cukes/cucumber-jvm-deps -->
<dependency>
    <groupId>info.cukes</groupId>
    <artifactId>cucumber-jvm-deps</artifactId>
    <version>1.0.5</version>
    <scope>provided</scope>
</dependency>
<!-- https://mvnrepository.com/artifact/info.cukes/cucumber-junit -->
<dependency>
    <groupId>info.cukes</groupId>
    <artifactId>cucumber-junit</artifactId>
    <version>1.2.5</version>
    <scope>test</scope>
</dependency>
<!-- https://mvnrepository.com/artifact/info.cukes/cucumber-java -->
<dependency>
    <groupId>info.cukes</groupId>
    <artifactId>cucumber-java</artifactId>
    <version>1.2.5</version>
</dependency>
<dependency>
    <groupId>org.json</groupId>
    <artifactId>json</artifactId>
    <version>20210307</version>
</dependency>
<!-- https://mvnrepository.com/artifact/com.aventstack/extentreports -->
<dependency>
    <groupId>com.aventstack</groupId>
    <artifactId>extentreports</artifactId>
    <version>3.1.2</version>
</dependency>
<!-- https://mvnrepository.com/artifact/org.apache.maven.plugins/maven-checkstyle-plugin -->
<dependency>
 <groupId>org.apache.maven.plugins</groupId>
 <artifactId>maven-checkstyle-plugin</artifactId>
 <version>3.1.1</version>
</dependency>
```
## SetUp
- Configure `extent-config.xml`
```
<?xml version="1.0" encoding="UTF-8"?>
<extentreports>
	<configuration>
		<!-- report theme --> <!-- standard, dark -->
		<theme>standard</theme>

		<!-- document encoding -->  <!-- defaults to UTF-8 -->
		<encoding>UTF-8</encoding>

		<!-- protocol for script and stylesheets -->   <!-- defaults to https -->
		<protocol>https</protocol>

		<!-- title of the document -->
		<documentTitle>Cucumber Framework</documentTitle>

		<!-- report name - displayed at top-nav -->
		<reportName>Cucumber Extent Report</reportName>

		<!-- global date format override -->  <!-- defaults to yyyy-MM-dd -->
		<dateFormat>yyyy-MM-dd</dateFormat>

		<!-- global time format override -->   <!-- defaults to HH:mm:ss -->
		<timeFormat>HH:mm:ss</timeFormat>

		<!-- custom javascript -->
		<scripts>
      <![CDATA[
        $(document).ready(function() {
        
        });
      ]]>
		</scripts>

		<!-- custom styles -->
		<styles>
      <![CDATA[
        
      ]]>
		</styles>
	</configuration>
</extentreports>
```

- create a runner class for cucumber project
- Run with tags. Here i have added `@getAPC, @negativeAPCtests` tags.
```java
import java.io.File;

import org.junit.AfterClass;
import org.junit.runner.RunWith;

import com.cucumber.listener.Reporter;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(format = { "pretty" }, features = "src//test//java//com//apcpoc//features", glue = {
		"com.apcpoc.stepdefinitions" }, tags = { "@getAPC, @negativeAPCscenario, @postAPC, @putAPC" }, plugin = {
				"com.cucumber.listener.ExtentCucumberFormatter:src/test/reports/cucumber_report.html",
				"html:output/html-report" }, monochrome = true)

public class RunCucumberTest {
	@AfterClass
	public static void writeExtentReport() {
		Reporter.loadXMLConfig(new File("src//test//java//com//apcpoc//configuration//extent-config.xml"));
		Reporter.setSystemInfo("user", System.getProperty("user.name"));
		Reporter.setSystemInfo("os", System.getProperty("os.name"));
		Reporter.setTestRunnerOutput("Runner Output message");
	}
}

```
## Add_features_and_respective_step_definitions
```feature

#Sample scenario for a GET request

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

#Sample scenario for a POST request

  @postAPC
  Scenario Outline: POST: Test the "api.reliefweb.com"
    Given I want to set URL as "<EndPoint>" with "<URL>" for test case "<TestName>"
    When I set header content type as "<ContentType>"
    When I hit the API with requestbody "<RequestBody>" and request method is "<RequestMethod>"
    Then I try to verify the status code is "<StatusCode>"
    And I try to verify the response value "count" is "2"

    Examples:
      | TestName         | EndPoint        | URL        | ContentType      | RequestBody | RequestMethod | StatusCode |
      | api.reliefweb test | reliefwebEndpoint | /reports?appname=apidoc | application/json |    testdata/reliefWebreqPostFormat.json         | POST           | 200        |

```

## Report
```
After execution of test scripts, the results are captured in extent report which is available in the following location.
Report Location: src/test/reports/extentReport.html

```