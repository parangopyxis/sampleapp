pipeline {
  agent any
  stages {
    stage('Welcome') {
      steps {
        echo 'Welcome to DevOps Training'
      }
    }
    stage('Run Tests') {
      steps {
        sh 'mvn test'
      }
    }
    stage('Publish Test Results') {
      steps {
        junit 'target/surefire-reports/*.xml'
      }
    }
    stage('Create Infrastructure') {
      steps {
        dir(path: './infrastructure/terraform/') {
          sh 'terraform plan'
        }
        
      }
    }
  }
}