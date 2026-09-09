pipeline {
    agent any

    environment {
        IMAGE_NAME = 'bharathkumar11/devops-web-app'
    }

    stages {

        stage('Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME:v1.0.0 .'
            }
        }

        stage('Test') {
    steps {
        sh 'exit 1'
    }
}

        stage('Push') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {
                    sh '''
                        echo "$DOCKER_PASSWORD" | docker login \
                            -u "$DOCKER_USERNAME" \
                            --password-stdin

                        docker push $IMAGE_NAME:v1.0.0
                    '''
                }
            }
        }
    }

    post {
        always {
            sh 'docker rm -f jenkins-test-app || true'
        }
    }
}