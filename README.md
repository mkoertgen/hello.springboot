# hello.springboot

<!-- shields not using travis-ci.com but only travis-ci.org yet
[![Build status](https://img.shields.io/travis/mkoertgen/hello.springboot.svg?logo=travis)](https://travis-ci.com/mkoertgen/hello.springboot/) -->
[![Build status](https://travis-ci.com/mkoertgen/hello.springboot.svg?branch=master)](https://travis-ci.com/mkoertgen/hello.springboot/)
[![GitHub issues](https://img.shields.io/github/issues/mkoertgen/hello.springboot.svg?logo=github "GitHub issues")](https://github.com/mkoertgen/hello.springboot)
[![GitHub stars](https://img.shields.io/github/stars/mkoertgen/hello.springboot.svg?logo=github "GitHub stars")](https://github.com/mkoertgen/hello.springboot)

Following along the [Spring Boot Guide](https://spring.io/guides/gs/spring-boot/#scratch).

- Built with JDK11, running on JDK12, so improved [docker container integration](https://blog.docker.com/2018/12/top-5-post-docker-container-java/)

## Build, Run, Test

Build & run using [Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html)

```console
cd app
./gradlew build
java -jar build/libs/app-0.1.0.jar
```

or using [docker-compose](https://docs.docker.com/compose/)

```console
docker-compose build
docker-compose up
```

## App

Test the hello endpoint

```console
$curl localhost:8080/hello
Hi from centralized configured greeting!
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

## Config-Server

Centralized [Spring Cloud Config](http://spring.io/projects/spring-cloud-config)-server.

Here with a simple File Backend, see e.g.: [
Spring Cloud Config with File System Backend](https://www.logicbig.com/tutorials/spring-framework/spring-cloud/cloud-config-with-file-system-backend.html)

Test the backend via

- [http://localhost:8888/{application}/{profile}](http://localhost:8888/app/dev)
- [http://localhost:8888/{application}-{profile}.yml](http://localhost:8888/app-dev.yml)
- [http://localhost:8888/{application}-{profile}.properties](http://localhost:8888/app-dev.properties)