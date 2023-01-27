package com.apcpoc.library;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

/**
 * Created By: Ganesh Prabhakaran
 * Version: 1.0
 */

public class PropertyFileReader {
    private static Properties properties;
    private static FileInputStream endpointfileInputStream;

    static {
        properties = new Properties();
        loadPerxProperties();
        setSystemProperties();
    }

    public static void loadPerxProperties() {
        File file = new File(System.getProperty("user.dir") + File.separator + "src" + File.separator + "test" + File.separator +
                "java" + File.separator + "com" + File.separator + "apcpoc"  + File.separator + "configuration" + File.separator + "endpoint.properties");

        try {
            endpointfileInputStream = new FileInputStream(file);
            properties.load(endpointfileInputStream);
            endpointfileInputStream.close();
        } catch (FileNotFoundException e) {
            throw new RuntimeException("Error : config properties file missing or corrupted - " + e);
        } catch (IOException e) {
            throw new RuntimeException("Error : Loading config properties - " + e);
        }
    }


    public static void setSystemProperties() {
        System.setProperty("imgflipEndpoint", properties.getProperty("imgflipEndpoint"));
        System.setProperty("wallpapersEndpoint", properties.getProperty("wallpapersEndpoint"));
        System.setProperty("dogbreedEndpoint", properties.getProperty("dogbreedEndpoint"));
        System.setProperty("baseCampEndpoint", properties.getProperty("baseCampEndpoint"));
        System.setProperty("reliefwebEndpoint", properties.getProperty("reliefwebEndpoint"));
        System.setProperty("openchargemapEndpoint", properties.getProperty("openchargemapEndpoint"));
    }

}
