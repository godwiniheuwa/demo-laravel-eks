pipeline {
    agent any

    options {
        buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '20'))
    }


    environment {
        IMAGE_TAG="latest"
        branch_name="main"
        AWS_ACCOUNT_ID="396608808038"
        AWS_DEFAULT_REGION="us-east-1"
        IMAGE_NAME = "laravel-eks"
        REPOSITORY_URI="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_NAME}"
        kubernatesHost="3.88.32.141"
        sshagentCredentials="k8s"
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout([$class: 'GitSCM', 
                        branches: [[name: "*/$branch_name"]], 
                        userRemoteConfigs: [[url: "https://github.com/godwiniheuwa/demo-laravel-eks", credentialsId: ""]]])
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    TAG = sh(script: 'date +"%Y%m%d_%H%M%S"-"$(git rev-parse --short=7 HEAD)"', returnStdout: true).trim()
                    sh "docker build -t $REPOSITORY_URI:$IMAGE_TAG -t $REPOSITORY_URI:$TAG ."
                }
            }
        }

        stage("Login") {
            steps {
                script{
                    sh "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    sh "docker push $REPOSITORY_URI:$IMAGE_TAG"
                    sh "docker push $REPOSITORY_URI:$TAG"
                }
            }
        }

        stage('Deployment') {
            steps {
                script {
                    echo "Start Deploying:\n|========================================|\n| BUILD_NUMBER:- $TAG |\n|========================================|\n"
                    sshagent(["${sshagentCredentials}"]) {
                        sh """
                            ssh -o StrictHostKeyChecking=no ec2-user@${kubernatesHost} 'kubectl set image deployment laravel-eks-api laravel-eks-api=396608808038.dkr.ecr.us-east-1.amazonaws.com/laravel-eks:$TAG'
                            ssh -o StrictHostKeyChecking=no ec2-user@${kubernatesHost} 'kubectl rollout status deploy laravel-eks-api --timeout=300s'
                        """
                    }
                }
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }

    }
}
