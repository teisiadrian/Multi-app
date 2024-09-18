pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/https://github.com/teisiadrian/Multi-app'
            }
        }
        stage('Build and Deploy App1') {
            steps {
                dir('app1') {
                    script {
                        dockerImageApp1 = docker.build("app1-image")
                    }
                }
                sh 'docker-compose up -d app1'
            }
        }
        stage('Build and Deploy App2') {
            steps {
                dir('app2') {
                    script {
                        dockerImageApp2 = docker.build("app2-image")
                    }
                }
                sh 'docker-compose up -d app2'
            }
        }
        stage('Deploy Database') {
            steps {
                sh 'docker-compose up -d db'
            }
        }
    }
}
