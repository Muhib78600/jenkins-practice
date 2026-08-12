pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
            }
        }
         stage('Test') {
            steps { 
                echo 'testing the built command'
            }
         }
        stage('Docker Build') {
            steps {
                sh 'docker build -t jenkins-docker-app:latest .'
            }
        }
       
        }
        stage('Deploy') {
            steps {
                sh 'docker rm -f jenkins-docker-app || true'
                sh 'docker run -d --name jenkins-docker-app -p 8081:80 jenkins-docker-app:latest'
            }
        }

        stage('Verify') {
            steps {
                sh 'docker ps'
                echo 'Application deployed successfully!'
            }
        }
    }
}
