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
                    // Check if a container with the name 'code' exists and remove it if it does
                    sh 'docker rm -f code || true'

                    // Run a new container
                    sh 'docker run -d -p 80:80 --name code operations'
                }
            }
        }

        stage('SCM') {
            checkout scm
        }
        stage('SonarQube Analysis') {
            def scannerHome = tool 'SonarScanner';
            withSonarQubeEnv() {
              sh "${scannerHome}/bin/sonar-scanner"
            }
          }
        
    }
}
