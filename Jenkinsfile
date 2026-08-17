pipeline {
    agent any
    triggers {
    cron('H/5 * * * *')
}
     parameters {
    string(
        name: 'PORT',
        defaultValue: '8081',
        description: 'Enter the host port for the application'
    )
}
    
environment {
    MY_SECRET = credentials('my-test-secret')
}
    stages {

        stage('Build') {
            steps {
                echo 'Building the application...'
            }
        }
                
stage('Credential Test') {
    steps {
        sh 'test -n "$MY_SECRET" && echo "Credential is available"'
    }
}            
        
        stage('Test') {
            steps {
                echo 'Testing the built application...'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t jenkins-docker-app:latest .'
            }
        }

      stage('Deploy') {
    steps {
        sh './deploy.sh'
    }
}
        stage('Verify') {
            steps {
                sh 'docker ps'
                echo 'Application deployed successfully!'
            }
        }
    }

    post {

        success {
            mail(
                to: 'muhammadsial11@gmail.com',
                subject: 'Success - Jenkins Pipeline',
                body: 'Pipeline completed successfully.'
            )
        }

        failure {
            mail(
                to: 'muhammadsial11@gmail.com',
                subject: 'Failed - Jenkins Pipeline',
                body: 'Pipeline did not complete successfully.'
            )
        }

        always {
            echo 'Pipeline execution finished.'
        }
    }
}
        
