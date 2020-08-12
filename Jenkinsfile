
pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
		withCredentials([string(credentialsId: 'root', variable: 'rootpwd')]) {
                sh "echo ${rootpwd} | sudo -S docker build -t 59351436/calculator:v1.0.0 ."
			}
          }
        }
        
        stage('DockerHub Push') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
              // some block
              sh "sudo echo ${dockerHubPwd} | sudo docker login -u 59351436 --password-stdin -S "
              sh "docker push 59351436/calculator:v1.0.0"
               }
            }
        }

        stage('Push Notification') {
			steps {
				withCredentials([string(credentialsId: 'telegramToken', variable: 'TOKEN'), 
				string(credentialsId: 'telegramChatId', variable: 'CHAT_ID')]) {
					sh """
					curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d parse_mode="HTML" -d text="<b>Project</b> : POC \
					<b>Branch</b>: master \
					<b>Build </b> : OK \
					<b>Test suite</b> = Passed"
					"""
				}			
			}
		}
    }
}
