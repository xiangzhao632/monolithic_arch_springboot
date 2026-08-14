FROM eclipse-temurin:17-jdk-alpine

MAINTAINER icyfenix

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JAVA_OPTS="" \
    PROFILES="default"

ADD /target/*.jar /bookstore.jar

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /bookstore.jar --spring.profiles.active=$PROFILES"]

EXPOSE 8080
