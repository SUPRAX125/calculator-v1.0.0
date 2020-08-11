
pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                sh "docker build -t 59351436/calculator:v1.0.0 ."
            }
        }
        
        stage('DockerHub Push') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
              // some block
              sh "docker login -u 59351436 -p ${dockerHubPwd}"
              sh "docker push 59351436/calculator:v1.0.0"
            }
            }
        }
    }
}
