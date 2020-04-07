FROM openjdk:8-jdk-alpine
VOLUME /tmp
EXPOSE 8090
RUN mvn clean install
ADD target/*.jar app.jar
ENTRYPOINT [ "sh", "-c", "java -jar /app.jar" ]