pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = 'docker-hub-creds'
	DOCKER_IMAGE = 'dipalikhandait1234/spirng-petclinic'
	GITHUB_CREDENTIALS = 'github-creds'
}
   
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', 
                    credentialsId: "${GITHUB_CREDENTIALS}", 
                    url: 'https://github.com/Dipali338/spring-petclinic.git'
            }
        }

        // Continue with your other stages
        stage('Build Docker Image') {
            steps {
		script {
			sh 'ls -l target'
                	def dockerImage = docker.build("${DOCKER_IMAGE")
            }
        }
     }
        stage('Push to Docker Hub') {
            steps {
		script {
		docker.withRegistry('https://index.docker.io/v1', "${DOCKERHUB_CREDENTIALS}"){
		docker.image("dipali338/spring-petclinic").push("latest")
		   }
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
