package Nova;


import io.github.bonigarcia.wdm.WebDriverManager;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.*;


import java.util.List;
import java.util.concurrent.TimeUnit;

public class testClass {

    WebDriver driver;

    @BeforeMethod
    public void setUp(){

        //to set up Chrome driver I used WebDriverManager
        WebDriverManager.chromedriver().setup();
        driver=new ChromeDriver();

        //create Implicit wait
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        driver.manage().timeouts().pageLoadTimeout(10,TimeUnit.SECONDS);
    }

    //TASK1:Given a URL, open a browser, collect all the links within the HTML
    // and check if all of them are ok (no 404 code).
    @Test
    public void test1() {
        driver.get("http://google.com");

        //to get all links on the page I used findElements with the tag name "a"
        List<WebElement> webElementList = driver.findElements(By.tagName("a"));
        for (WebElement webElement : webElementList) {

        //to get actual link url I used getAttribute with href
        String link = webElement.getAttribute("href");
        RestAssured.baseURI = link;
        Response response = RestAssured.given().log().all().
                    get();

        //to verify all links are active I sent GET request and verify that Response Code is not 404
        Assert.assertTrue(response.getStatusCode() != 404);
        }
    }

    //TASK2: In the same website, there is a <table></table>. Code or describe the algorithm to count
    // and output the number of <tr></tr> elements (number of rows).
    @Test
     public void test2(){
        driver.get("https://www.rahulshettyacademy.com/AutomationPractice/");

        //to get all the number of "Web Table Example" raw, first we need to locate table and than get all the raw elements
        //I used xpath to locate costume table and get all the raw elements
        List<WebElement> webElementList=driver.findElements(By.xpath("//div[@class='left-align']//table[@id='product']/tbody/tr"));

        int expectedResult=11;

        //the size of list elements give us the number of raw
        int actualResult=webElementList.size();

        //I verified that whether it is expected or not
        Assert.assertEquals(actualResult,expectedResult);
     }

    @AfterMethod
    public void tearDown(){
        //quit browser
        driver.quit();
    }
}
