package com.apcpoc.runner;

import java.io.File;

import org.junit.AfterClass;
import org.junit.runner.RunWith;

import com.cucumber.listener.Reporter;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

/**
 * Created By: Ganesh Prabhakaran
 * Version: 1.0
 */

@RunWith(Cucumber.class)
@CucumberOptions(format = {"pretty"}, features = "src//test//java//com//apcpoc//features", glue = {
        "com.apcpoc.stepdefinitions"}, tags = {"@getAPC, @negativeAPCscenario, @postAPC, @putAPC"}, plugin = {
        "com.cucumber.listener.ExtentCucumberFormatter:src/test/reports/ExtentReport.html"}, monochrome = true)

public class RunCucumberTest {
    @AfterClass
    public static void writeExtentReport() {
        Reporter.loadXMLConfig(new File("src//test//java//com//apcpoc//configuration//extent-config.xml"));
        Reporter.setSystemInfo("user", System.getProperty("user.name"));
        Reporter.setSystemInfo("os", System.getProperty("os.name"));
        Reporter.setTestRunnerOutput("Runner Output message");
    }
}
