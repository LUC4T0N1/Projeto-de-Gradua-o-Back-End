
#
# Build stage
#
FROM maven:3.6.3-jdk-11 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:11
#COPY --from=build /home/app/target/PGC-1.0.0-runner.jar /usr/local/lib/demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/home/app/target/PGC-1.0.0-runner.jar"]