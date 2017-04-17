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
          "": {
            junit 'surefire-reports/*.xml'
            
          }
        )
      }
    }
  }
}