# hello.springboot

Following along the [Spring Boot Guide](https://spring.io/guides/gs/spring-boot/#scratch).

## Build, Run, Test

Build & run using [Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html)

```console
cd app
./gradlew build
java -jar build/libs/gs-spring-boot-0.1.0.jar
```

or using [docker-compose](https://docs.docker.com/compose/)

```console
docker-compose build app
docker-compose up app
```

Test the hello endpoint

```console
$curl localhost:8080
Greetings from Spring Boot!
```

Review [application.properties](src/main/resources/application.properties) and test actuator endpoints

```console
$curl localhost:8080/actuator/health
{"status":"UP"}

$curl localhost:8080/actuator/info
{}

$curl -X POST localhost:8081/actuator/shutdown
{"message":"Shutting down, bye..."}
```
