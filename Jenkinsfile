
pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                sh "sudo docker build -t 59351436/calculator:v1.0.0 ."
            }
        }
        
        stage('DockerHub Push') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
              // some block
              sh "sudo docker login -u 59351436 -p ${dockerHubPwd}"
              sh "sudo docker push 59351436/calculator:v1.0.0"
            }
            }
        }
    }
}
