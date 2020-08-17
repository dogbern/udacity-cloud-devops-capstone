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
        stage('Lint') {
            steps {
                sh 'hadolint --ignore DL3013 $WORKSPACE/Dockerfile'
                sh 'tidy -q -e $WORKSPACE/templates/index.html'
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
                    withDockerRegistry(registry: [credentialsId: registryCredential]) {
                        dockerImage.push('latest')
                    }       
                }
            }
        }
        stage('Remove Image from Jenkins') {
            steps {
                sh "docker rmi $registry:latest"
            }
        }
        stage('set current kubectl context') {
            steps {
                sh '$WORKSPACE/deployment/green-context.sh'
            }
        }
        stage('Deploy Green Container') {
            steps {
                sh 'kubectl apply -f $WORKSPACE/deployment/deployment.yaml'
                sh 'kubectl apply -f $WORKSPACE/deployment/service.yaml'
            }
        }

        stage('Edit DNS record set to point to Green service') {
            steps {
                sh '$WORKSPACE/deployment/route53.sh'
            }
        }
      
    }
}