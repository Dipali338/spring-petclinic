pipeline {
  agent any
  stages {
    stage('Build Docker Image') {
      steps {
        script {
          dockerImage = docker.build("yourusername/spring-petclinic")
        }
      }
    }
    stage('Push to Docker Hub') {
      steps {
        withDockerRegistry([credentialsId: 'dockerhub-creds', url: '']) {
          script {
            dockerImage.push("latest")
          }
        }
      }
    }
  }
}
