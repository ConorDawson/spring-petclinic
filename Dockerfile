# Use a modern, official OpenJDK Alpine image
FROM openjdk:17-jdk-slim
# Set a maintainer label
LABEL maintainer="cinir21"

# Set a working directory
WORKDIR /home

# Copy the JAR file into the container
COPY target/spring-petclinic-3.4.0-SNAPSHOT.jar /home/spring-petclinic.jar

# Expose the default Spring Boot port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "/home/spring-petclinic.jar"]
