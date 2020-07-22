pipeline {
    agent { dockerfile true }
    stages {
        stage('AWS Credentials') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_cred', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
                sh """  
                    mkdir -p ~/.aws
                    echo "[default]" >~/.aws/credentials
                    echo "[default]" >~/.boto
                    echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >>~/.boto
                    echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}">>~/.boto
                    echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >>~/.aws/credentials
                    echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}">>~/.aws/credentials
                """
            }
        }
        stage('Linting') {
            steps {
                sh 'node --version'
            }
        }
        stage('Build Image') {
            steps {
                sh 'node --version'
            }
        }
        stage('Push Image') {
            steps {
                sh 'node --version'
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