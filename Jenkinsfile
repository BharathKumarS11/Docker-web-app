pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh 'docker build -t devops-web-app:jenkins .'
            }
        }

        stage('Test') {
            steps {
                sh 'docker run -d --name jenkins-test-app -p 80:80 devops-web-app:jenkins'
                sh 'sleep 3'
                sh 'curl --fail http://localhost:80'
            }
        }
    }

    post {
        always {
            sh 'docker rm -f jenkins-test-app || true'
        }

        success {
            echo 'Docker application test passed!'
        }

        failure {
            echo 'Docker application test failed!'
        }
    }
}