# Utilise l'image officielle Maven avec Java 21 Temurin comme image de base pour la construction
FROM maven:3.9.5-eclipse-temurin-21 AS build

# Définit le répertoire de travail dans le conteneur
WORKDIR /app

# Copie le fichier pom.xml et les sources du projet dans le conteneur
COPY pom.xml /app/
COPY lombok.config lombok.config
COPY src /app/src/
COPY src/main/resources /app/resources

# Exécute Maven pour construire le projet en utilisant la variable d'environnement pour le profil
#ARG MAVEN_PROFILE
#ARG POSTGRES_PASSWORD
RUN mvn clean package -Dmaven.test.skip=true

# Utilise l'image officielle Temurin Java 21 pour l'exécution
FROM maven:3.9.5-eclipse-temurin-21

#ARG MAVEN_PROFILE
#ARG POSTGRES_PASSWORD
#ENV SPRING_PROFILES_ACTIVE=${MAVEN_PROFILE}

# Copie le JAR construit à partir de l'étape de build dans cette image
COPY --from=build /app/target/*.jar /app/app.jar
COPY src/main/resources /app/resources
COPY --from=build /app/resources /app/resources

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
