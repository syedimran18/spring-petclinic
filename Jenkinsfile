pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github-token', url: 'https://github.com/syedimran18/spring-petclinic.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    sh './mvnw package'
                }
            }
        }
        // stage('Test') {
        //     steps {
        //         script {
        //             sh './mvnw test'
        //         }
        //     }
        // }
        stage('Deploy') {
            steps {
                script {
                    sh 'ls && pwd'
                }
            }
        }
    }
}
