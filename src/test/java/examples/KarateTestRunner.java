package examples;



import org.testng.Assert;
import org.testng.annotations.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;


public class KarateTestRunner {

    @Test
    public void testAll() {
        Results results = Runner.path("classpath:examples/sample.feature").parallel(1);
        Assert.assertTrue(results.getFailCount() == 0);
    }
}

