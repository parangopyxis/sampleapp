pipeline {
  agent any
  stages {
    stage('Welcome') {
      steps {
        echo 'Welcome to DevOps Training'
      }
    }
    stage('Prepare local environment') {
      steps {
        dir(path: './infrastructure/ansible/playbooks') {
          ansiblePlaybook(playbook: 'provision_server.yml', colorized: true, inventory: 'hosts/local_inventory')
        }
        
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
  }
}