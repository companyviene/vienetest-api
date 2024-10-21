# Lessonviene Project

This project is a Spring Boot application that uses PostgreSQL as its database. It is containerized using Docker Compose to manage both the application and database services.

## Project Structure

- `app`: Spring Boot application that interacts with the PostgreSQL database.
- `db`: PostgreSQL database service.

## Requirements

- Docker and Docker Compose installed on your machine.
- Maven installed for building the Spring Boot application.
- JDK 21 or higher.

## Getting Started

### Step 1: Clone the Repository

git clone <your-repo-url>
cd <your-repo-directory>

### Step 2: Build the Application
Before running the Docker Compose, you need to build the Spring Boot application using Maven:

mvn clean package

### Step 3: Run with Docker Compose
To start the application and the PostgreSQL database, run the following command:

docker-compose up --build

### Step 4: Run with Docker Compose

http://localhost:8083
