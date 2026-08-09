pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t jenkins-docker-app:latest .'
            }
        }

        stage('Test') {
            steps {
                echo 'Docker image built successfully!'
            }
        }
    }
}
