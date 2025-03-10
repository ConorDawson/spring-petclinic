# Use a modern, official OpenJDK Alpine image
FROM openjdk:11-jdk-alpine

# Set a maintainer label
LABEL maintainer="ConorDawson"

# Set a working directory
WORKDIR /home

# Copy the JAR file into the container
COPY target/spring-petclinic-1.5.1.jar /home/spring-petclinic.jar

# Expose the default Spring Boot port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "/home/spring-petclinic.jar"]
