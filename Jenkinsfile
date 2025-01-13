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
         stage('Trivy Scan') {
            steps {
                script {
                    // Run Trivy to scan the Docker image for vulnerabilities
                    // --exit-code 1 will fail the build if any vulnerabilities are found
                    // --severity HIGH,CRITICAL will only show high and critical vulnerabilities
                    sh "trivy image --exit-code 1 --severity HIGH,CRITICAL operations"
                }
            }
        }

        
    }
}
