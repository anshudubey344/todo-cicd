pipeline {
    agent any
    environment {
        
        S3_BUCKET = 'node-js-bucket'  // Replace with your S3 bucket name
    }
    tools {
        nodejs '18.19.1'    
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/anshudubey344/todo-cicd.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'npm test'  // Assuming tests are configured
            }
        }
        
        
        stage('Deploy to EC2 via CodeDeploy') {
            steps {
                withCredentials([
                    [
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-cred',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                    ]
                ]) {
                    step([$class: 'AWSCodeDeployPublisher',
                          region: 'us-east-1',     
                          deploymentGroupAppspec: false,
                          applicationName: 'todo-app',         // Replace with your CodeDeploy app name
                          deploymentGroupName: 'nodejs-Dg',    // Replace with your deployment group name
                          deploymentConfig: 'CodeDeployDefault.OneAtATime',
                          s3bucket: "${S3_BUCKET}",
                          s3prefix: '',                        // Leave this empty to use the root of the bucket
                          includes: '/*'
                          
                    ])
                }
            }
        }
    }
}
