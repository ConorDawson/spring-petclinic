pipeline {
    agent any

    environment {
        IMAGE_NAME = "cinir21/spring-petclinic"
        CONTAINER_REGISTRY = "docker.io"
        DOCKER_USER = "cinir21"
        DOCKER_PASS = "Avacado1?"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/ConorDawson/spring-petclinic.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $IMAGE_NAME:latest'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p 8080:8080 --name petclinic $IMAGE_NAME:latest'
            }
        }
    }

    post {
        always {
            sh 'docker rm -f petclinic || true'
            sh 'docker rmi -f $IMAGE_NAME:latest || true'
        }
    }
}
