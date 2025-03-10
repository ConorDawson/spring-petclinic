pipeline {
    agent any

    environment {
        IMAGE_NAME = "cinir21/spring-petclinic"
        CONTAINER_REGISTRY = "docker.io"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/ConorDawson/spring-petclinic.git'
            }
        }

        stage('Build with Maven') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push $IMAGE_NAME:latest'
            }
        }

        stage('Deploy Container') {
            steps {
                bat 'docker run -d -p 8080:8080 --name petclinic $IMAGE_NAME:latest'
            }
        }
    }

    post {
        always {
            bat 'docker rm -f petclinic || true'
            bat 'docker rmi -f $IMAGE_NAME:latest || true'
        }
    }
}
