pipeline {
    agent any

    environment {
        // Define the SonarQube server and scanner
        SONARQUBE_SERVER = 'SonarQube Scanner'  // This should match the SonarQube server name you configured in Jenkins
    }
    
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

                    // Run new container
                    sh 'docker run -d -p 80:80 --name code operations'
                }
            }
        }
         stage('Trivy Scan') {
            steps {
                script {
                     sh 'trivy image operations'
                }
            }
        }
        stage('SonarQube Analysis') {
            steps {
                // Run SonarQube analysis
                script {
                    withSonarQubeEnv('SonarQube') {  // This should match the 'Name' of SonarQube you configured
                        sh '''
                            ./venv/bin/python -m pip install pytest
                            sonar-scanner \
                                -Dsonar.projectKey=your_project_key \
                                -Dsonar.projectName=your_project_name \
                                -Dsonar.sources=. \
                                -Dsonar.python.coverage.reportPaths=coverage.xml
                        '''
                    }
                }
            }
        }
    }
    post {
        success {
            echo 'SonarQube Analysis Completed Successfully'
        }

        failure {
            echo 'SonarQube Analysis Failed'
        }
    }
}
