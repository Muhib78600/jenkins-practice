pipeline {
    agent any
            
    triggers {
    cron('H/2 * * * *')
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
        stage('Checkout') {
    steps {
        checkout([
            $class: 'GitSCM',
            branches: [[name: '*/main']],
            userRemoteConfigs: [[
                url: 'https://github.com/Muhib78600/jenkins-practice.git'
            ]]
        ])
    }
}
        stage('Build') {
            steps {
                echo 'Building the application...'
            }
        }
    stage('Run Script') {
    steps {
        sh 'chmod +x script.sh'
        sh './script.sh'
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


  
