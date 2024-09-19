pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                // Clone the repository
                git 'https://github.com/teisiadrian/Multi-app.git'
            }
        }
        stage('Build and Push Docker Images') {
            steps {
                script {
                    // Build Docker images for app1 and app2
                    sh 'docker-compose build'
                }
            }
        }
        stage('Deploy Containers') {
            steps {
                script {
                    // Deploy the services using docker-compose
                    sh 'docker-compose up -d'
                }
            }
        }
    }

    post {
        always {
            // Clean up resources after the pipeline finishes
            sh 'docker-compose down'
        }
    }
}
