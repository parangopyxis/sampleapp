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
        sh '''chmod -x ./infrastructure/ansible/playbooks/hosts/local_inventory
ansible-playbook -i ./infrastructure/ansible/playbooks/hosts/local_inventory ./infrastructure/ansible/playbooks/provision_server.yml -s -U root'''
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