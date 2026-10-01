FROM eclipse-temurin:21-jre

WORKDIR /app

ENV RESOURCE_PATH=/app/src/main/resources
ENV OUTPUT_PATH=/app/output

COPY pom.xml .
COPY target/javaparser-maven-sample-1.0-SNAPSHOT-shaded.jar app.jar
COPY src/main/resources/ src/main/resources/

ENTRYPOINT ["java", "-jar", "app.jar"]
