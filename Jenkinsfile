pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = 'docker-hub-creds'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', 
                    credentialsId: 'github-creds', 
                    url: 'https://github.com/Dipali338/spring-petclinic.git'
            }
        }

        // Continue with your other stages
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t spring-petclinic-app .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([ credentialsId: "${DOCKERHUB_CREDENTIALS}" ]) {
                    sh 'docker tag spring-petclinic-app dipalikhandait1234/spring-petclinic-app:latest'
                    sh 'docker push dipalikhandait1234/spring-petclinic-app:latest'
                }
            }
        }
    }

    post {
        failure {
            echo '❌ Build or push failed!'
            sh 'docker logout'
        }
        success {
            echo '✅ Build and push successful!'
            sh 'docker logout'
        }
    }
}

