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
        parallel(
          "Publish Test Results": {
            junit 'target/surefire-reports/*.xml'
            
          },
          "reset env hosts": {
            dir(path: './infrastructure/ansible/playbooks') {
              sh 'echo \'[workshop_servers]\' > hosts/qa_inventory'
            }
            
            
          }
        )
      }
    }
    stage('[Ansible] Provision Infrastructure') {
      steps {
        dir(path: './infrastructure/ansible/playbooks') {
          ansiblePlaybook(playbook: 'provision_infrastructure.yml', extras: '-e env=qa', installation: 'ansible-latest')
        }
        
      }
    }
  }
}