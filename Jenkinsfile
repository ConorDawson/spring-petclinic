#!groovy
pipeline {
    agent any

    stages {     
        stage('Maven Install') {
            agent {         
                docker { image 'maven:3.8.7' }       
            }       
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t cinir21/spring-petclinic:latest .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                    sh 'echo "$dockerHubPassword" | docker login -u "$dockerHubUser" --password-stdin'
                    sh 'docker push cinir21/spring-petclinic:latest'
                }
            }
        }
    }
}
