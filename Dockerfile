FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /opt/app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY ./src ./src
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:17-jdk-alpine as final
MAINTAINER icyfenix

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JAVA_OPTS="" \
    PROFILES="default"

WORKDIR /opt/app
EXPOSE 8080

COPY --from=builder /opt/app/target/*.jar /opt/app/bookstore.jar

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /opt/app/bookstore.jar --spring.profiles.active=$PROFILES"]
