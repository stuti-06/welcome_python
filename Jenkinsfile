pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/stuti-06/welcome_python.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t operations .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run new container
                    sh 'docker run -d -p 80:80 --name code operations'
                }
            }
        }
    }
}
