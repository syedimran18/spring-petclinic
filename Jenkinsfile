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
                // Clone the repository
                git branch: 'main', url: 'https://github.com/syedimran18/spring-petclinic.git'
            }
        }
        stage('Build') {
            steps {
                // Build the project using Maven
                script {
                    sh './mvnw clean package'
                }
            }
        }
        stage('Docker Build') {
            steps {
                // Build the Docker image from the Dockerfile
                script {
                    sh "docker build -t ${DOCKER_IMAGE}:latest ."
                }
            }
        }
        stage('Deploy Locally') {
            steps {
                script {
                    // Stop and remove any running container with the same name
                    sh """
                    docker ps -q --filter 'name=spring-petclinic' | xargs -r docker stop
                    docker ps -a -q --filter 'name=spring-petclinic' | xargs -r docker rm
                    """

                    // Run the new Docker container and map ports
                    sh "docker run -d --name spring-petclinic -p ${HOST_PORT}:${CONTAINER_PORT} ${DOCKER_IMAGE}:latest"
                }
            }
        }
    }

    post {
        always {
            // Cleanup: stop and remove containers after the pipeline run
            sh """
            docker ps -q --filter 'name=spring-petclinic' | xargs -r docker stop
            docker ps -a -q --filter 'name=spring-petclinic' | xargs -r docker rm
            """
        }
    }
}
