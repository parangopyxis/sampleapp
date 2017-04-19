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
          sh '''export AWS_ACCESS_KEY_ID="AKIAIN3SNTS2XMIERR6Q"
export AWS_SECRET_ACCESS_KEY="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"
'''
          ansiblePlaybook(playbook: 'provision_infrastructure.yml', extras: '-e env=qa', installation: 'ansible-latest')
        }
        
      }
    }
  }
}