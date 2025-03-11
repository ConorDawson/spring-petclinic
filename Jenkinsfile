#!groovy
pipeline {
    agent none
   stages {     
    stage('Maven Install') {
      agent {         
       docker {          
         image 'maven:3.8.7'         
     }       
  }       
  steps {
       sh 'mvn clean install'
       }
     }
        stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t cinir/Spring-PetClinic:latest .'
      }
    }
   }
 }
