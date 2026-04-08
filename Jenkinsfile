pipeline {
    agent any

    tools {
        jdk 'jdk-latest'
        nodejs 'nodejs'
    }

    environment {
        IMAGE_NAME = "my-web-app"
        DOCKER_CREDENTIALS = "docker"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/abdelftah-aboelwafa/End-to-End.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarqube-server') {
                    sh '''
                    sonar-scanner \
                    -Dsonar.projectKey=my-ci-proj \
                    -Dsonar.sources=.
                    '''
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }

        stage('Trivy Scan') {
            steps {
                script {
                    sh "trivy image --exit-code 1 --severity HIGH,CRITICAL ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', DOCKER_CREDENTIALS) {
                        docker.image("${IMAGE_NAME}:${IMAGE_TAG}").push()
                    }
                }
            }
        }


        stage('Clean Artifacts') {
            steps {
                echo 'Cleaning temporary files and old artifacts...'
                sh '''
                rm -rf node_modules/
                rm -rf dist/
                rm -rf *.zip *.tar
                '''
            }
        }
        ### to clean old image ###
        stage('Clean Docker Image') {
            steps {
                sh "docker image rm ${IMAGE_NAME}:${IMAGE_TAG} || true"
            }
        }
    }

    post {
    success {
        echo 'Pipeline completed successfully'
        emailext (
            subject: "SUCCESS: Jenkins Pipeline ${currentBuild.fullDisplayName}",
            body: "Hello,\n\nThe Jenkins pipeline ${env.JOB_NAME} #${env.BUILD_NUMBER} completed successfully.\n\nRegards,\nJenkins",
            to: 'abdelfth.aboelwafa@outlook.com',
            from: 'jenkins@example.com',
            replyTo: 'jenkins@example.com',
            recipientProviders: [[$class: 'DevelopersRecipientProvider']],
            credentialsId: 'email'
        )
    }
    failure {
        echo 'Pipeline failed'
        emailext (
            subject: "FAILURE: Jenkins Pipeline ${currentBuild.fullDisplayName}",
            body: "Hello,\n\nThe Jenkins pipeline ${env.JOB_NAME} #${env.BUILD_NUMBER} failed.\nCheck the console output for details.\n\nRegards,\nJenkins",
            to: 'abdelfth.aboelwafa@outlook.com',
            from: 'jenkins@example.com',
            replyTo: 'jenkins@example.com',
            recipientProviders: [[$class: 'DevelopersRecipientProvider']],
            credentialsId: 'email'
        )
    }
}