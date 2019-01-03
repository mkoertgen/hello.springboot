package hello;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

// allow refreshing properties, cf.:
// https://spring.io/guides/gs/centralized-configuration/#_reading_configuration_from_the_config_server_using_the_config_client
@RefreshScope
@RestController
public class HelloController {
    @Value("${app.greeting:Greetings from Spring Boot!}")
    private String greeting;

    @RequestMapping("/hello")
    public String index() {
        return greeting;
    }
}