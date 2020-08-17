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
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
        stage('set current kubectl context') {
            steps {
                sh "kubectl config use-context i-03ffec29d41e694c3@green-environment.us-east-2.eksctl.io"
            }
        }
        stage('Deploy Green Container') {
            steps {
                sh 'kubectl appl -f $WORKSPACE/deployment/deployment.yaml'
                sh 'kubectl appl -f $WORKSPACE/deployment/service.yaml'
            }
        }

        stage('Edit DNS record set to point to Green service') {
            steps {
                sh '$WORKSPACE/deployment/route53.sh'
            }
        }
      
    }
}