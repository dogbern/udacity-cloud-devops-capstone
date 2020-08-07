pipeline {
    environment {
        registry = "dogbern/capstone-project-green-app"
        registryCredential = 'dockerhub_id'
        dockerImage = ''
    }
    agent any
    
    stages {
        stage('Cloning Git') {
            steps {
                git 'https://github.com/dogbern/udacity-cloud-devops-capstone.git'
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
                    docker.withRegistry('https://registry.hub.docker.com', registryCredential)
                    dockerImage.push()
                }
            }
        }
        stage('Remove Image from Jenkins') {
            steps {
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
      
    }
}