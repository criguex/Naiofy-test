package wolox.naiofy_features;

import com.intuit.karate.junit5.Karate;

class Runner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("register").relativeTo(getClass());
    }

}
