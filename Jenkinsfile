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
          ansiblePlaybook(playbook: 'provision_infrastructure.yml', installation: 'ansible-latest', extras: '-e env=qa -vvv')
        }
        
      }
    }
  }
  environment {
    AWS_ACCES_KEY_ID = 'AKIAIN3SNTS2XMIERR6Q'
    AWS_SECRET_ACCESS_KEY = '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'
  }
}