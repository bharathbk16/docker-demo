FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY pom.xml /tmp/
RUN mvn -f /tmp/pom.xml
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn jar:jar

FROM java:8-jre-alpine

EXPOSE 8080

RUN mkdir /app
COPY --from=MAVEN_TOOL_CHAIN /tmp/target/*.jar /app/spring-boot.jar

ENTRYPOINT ["java","-jar","/app/spring-boot.jar"]