pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-key')
        GIT_TOKEN = credentials('git-token')
    }

    stages {
        stage('Git Checkout') {
            steps {
                script {
                    try {
                        checkout([
                            $class: 'GitSCM',
                            branches: [[name: 'main']],
                            userRemoteConfigs: [[
                                url: 'https://github.com/Shantanu3009/gcp-jenkins-pipeline.git',
                                credentialsId: 'git-token'
                            ]]
                        ])
                    } catch (Exception e) {
                        error("Git Checkout failed: ${e.message}")
                    }
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    try {
                        sh 'terraform init'
                    } catch (Exception e) {
                        error("Terraform Init failed: ${e.message}")
                    }
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                script {
                    try {
                        sh 'terraform validate'
                    } catch (Exception e) {
                        error("Terraform Validate failed: ${e.message}")
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    try {
                        sh 'terraform plan -out=tfplan'
                    } catch (Exception e) {
                        error("Terraform Plan failed: ${e.message}")
                    }
                }
            }
        }

        stage('Manual Approval') {
            steps {
                input message: "Approve the Terraform changes?"
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    try {
                        sh 'terraform apply -auto-approve tfplan'
                    } catch (Exception e) {
                        error("Terraform Apply failed: ${e.message}")
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for details.'
        }
    }
}
