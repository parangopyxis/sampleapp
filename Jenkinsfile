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
    stage('[Terraform] deploy Infrastructure') {
      steps {
        dir(path: './infrastructure/terraform/') {
          sh 'terraform plan'
          sh 'terraform apply'
        }
        
      }
    }
    stage('[Ansible] Configure Platform') {
      steps {
        dir(path: './infrastructure/ansible/playbooks/') {
          ansiblePlaybook(playbook: 'provision_server.yml', colorized: true, installation: 'ansible-latest', inventory: 'hosts/qa_inventory', extras: '--check')
        }
        
      }
    }
  }
}