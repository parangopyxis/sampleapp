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
  }
}