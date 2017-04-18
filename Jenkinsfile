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
        ansiblePlaybook(playbook: './infrastructure/ansible/playbooks/provision_server.yml', colorized: true, inventoryContent: '[workshop_servers] localhost ansible_connection=local')
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