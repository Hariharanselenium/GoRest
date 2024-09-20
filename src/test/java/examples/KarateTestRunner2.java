package examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.testng.Assert;
import org.testng.annotations.Test;

public class KarateTestRunner2 {

    @Test
    public void testAll() {
        // The path should start from 'classpath:' and point to the correct relative location
        Results results = Runner.path("classpath:examples/Gorest3.feature").parallel(1);
       Assert.assertTrue(results.getFailCount() == 0, "There are test failures");
    }
}

