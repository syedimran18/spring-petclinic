pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'petclinic'  
        HOST_PORT = '8081'  
        CONTAINER_PORT = '8080'  
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/spring-projects/spring-petclinic.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    sh './mvnw package'
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    // Build Docker image locally
                    sh "docker build -t ${DOCKER_IMAGE}:latest ."
                }
            }
        }
        stage('Deploy Locally') {
            steps {
                script {
                    // Stop any previous container with the same name
                    sh "docker ps -q --filter 'name=spring-petclinic' | xargs -r docker stop"

                    // Remove any previous container with the same name
                    sh "docker ps -a -q --filter 'name=spring-petclinic' | xargs -r docker rm"

                    // Run the new Docker container locally, binding to the new host port
                    sh "docker run -d --name spring-petclinic -p ${HOST_PORT}:${CONTAINER_PORT} ${DOCKER_IMAGE}:latest"
                }
            }
        }
    }
}
