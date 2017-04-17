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
        parallel(
          "Test": {
            sh 'mvn test'
            
          },
          "error": {
            junit 'target/surefire-reports/*.xml'
            
          }
        )
      }
    }
  }
}