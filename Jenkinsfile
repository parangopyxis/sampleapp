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
    stage('[Ansible] Provision Infrastructure') {
      steps {
        dir(path: './infrastructure/ansible/playbooks') {
          ansiblePlaybook(playbook: 'provision_infrastructure.yml', installation: 'ansible-latest')
        }
        
      }
    }
  }
}