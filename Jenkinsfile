pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', credentialsId: 'github-token', url: 'https://github.com/syedimran18/spring-petclinic.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    sh './mvnw clean install -DskipTests'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh './mvnw test'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Add deployment commands here (e.g., to a server, Docker container)
                }
            }
        }
    }
}
