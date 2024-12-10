# Use an OpenJDK base image for running the Spring Boot application
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the pre-built JAR file from your host to the container
COPY target/spring-petclinic-*.jar spring-petclinic.jar

# Expose the port your application will run on
EXPOSE 8080

# Define the entrypoint to run the application
ENTRYPOINT ["java", "-jar", "spring-petclinic.jar"]
