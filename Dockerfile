# Use official Java image
FROM openjdk:17-jdk-slim

# Copy the JAR file into the image
COPY target/spring-petclinic-3.5.0-SNAPSHOT.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
