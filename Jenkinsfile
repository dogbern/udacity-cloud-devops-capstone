pipeline {
    environment {
        registry = "dogbern/blue-app"
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
                sh "docker rmi $registry:latest"
            }
        }
        stage('Security Scan Image') {
            steps {
                aquaMicroscanner imageName: "dogbern/capstone-project-green-app:latest", notCompliesCmd: 'exit 1', onDisallowed: 'fail', outputFormat: 'html'
            }
        }
        stage('set current kubectl context') {
            steps {
                sh 'kubectl config use-context arn:aws:eks:us-east-2:620145408342:cluster/blue-environment'
            }
        }
        stage('Deploy Blue Container') {
            steps {
                sh 'kubectl apply -f $WORKSPACE/deployment/deployment.yaml'
                sh 'kubectl apply -f $WORKSPACE/deployment/service.yaml'
            }
        }

        stage('Edit DNS record set to point to Green service') {
            steps {
                sh 'aws route53 change-resource-record-sets --hosted-zone-id Z047210437EDQ22T6THSN --change-batch file://$WORKSPACE/deployment/change_res_record_set.json'
            }
        }
      
    }
}