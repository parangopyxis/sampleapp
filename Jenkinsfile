pipeline {
  agent any
  stages {
    stage('Welcome') {
      steps {
        parallel(
          "Welcome": {
            echo 'Welcome to DevOps Training'
            
          },
          "Prepare local environment": {
            ansiblePlaybook(playbook: 'infrastructure/ansible/playbooks/provision_server.yml', colorized: true, inventory: 'infrastructure/ansible/playbooks/hosts/local_inventory')
            
          }
        )
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