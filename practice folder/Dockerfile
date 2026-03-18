#-------------Multistage for java
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go offline
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from:builder /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

#----------------------------------------

FROM node:20-alpine
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 3000
CMD ["npm", "start"]

#-----------------------------------------

FROM ngnix:1.25-alpine
RUN rm /etc/ngnix/conf.d/default.conf
COPY ngnix.conf /etc/ngnix/conf.d
COPY html/ /usr/share/ngnix/html/
EXPOSE 80 
CMD ["ngnix", "-g", "demon-off;"]
