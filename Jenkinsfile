pipeline {
    environment {
        registry = "dogbern/capstone-project-green-app"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    agent { dockerfile true }
    stages {
        stage('Linting') {
            steps {
                sh 'node --version'
            }
        }
        stage('Build Image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('', registryCredential)
                    dockerImage.push()
                }
            }
        }
        stage('Remove Image from Jenkins') {
            steps {
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
        stage('set current kubectl context') {
            steps {
                sh 'node --version'
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'node --version'
            }
        }
    }
}