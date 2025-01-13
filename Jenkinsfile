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

                    // Run a new container
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
                // Use the 'withSonarQubeEnv' step to inject the SonarQube environment variables
                withSonarQubeEnv('SONARQUBE_SERVER') { 
                    // Run the SonarScanner for Python analysis
                    sh '''
                        sonar-scanner \
                            -Dsonar.projectKey=my-python-project \
                            -Dsonar.sources=. \
                            -Dsonar.python.version=3.8 \
                            -Dsonar.python.pylint.reportPath=pylint-report.json
                    '''
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
