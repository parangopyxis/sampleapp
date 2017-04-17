pipeline {
  agent any
  stages {
    stage('Welcome') {
      steps {
        echo 'Welcome to DevOps Training'
      }
    }
    stage('Test') {
      steps {
        sh 'mvn test'
      }
    }
    stage('Publish Test Results') {
      steps {
        parallel(
          "Publish Test Results": {
            junit 'target/surefire-reports/*.xml'
            
          },
          "Prepare Infrastructure Plan": {
            sh '''cd infrastructure/terraform/
terraform plan'''
            
          }
        )
      }
    }
  }
}