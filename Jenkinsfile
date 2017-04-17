pipeline {
  agent any
  stages {
    stage('Welcome') {
      steps {
        parallel(
          "Welcome": {
            echo 'Welcome to DevOps Training'
            
          },
          "Pull changes": {
            sh 'git pull origin master'
            
          }
        )
      }
    }
    stage('Prepare local environment') {
      steps {
        ansiblePlaybook(playbook: 'infrastructure/ansible/playbooks/provision_server.yml', colorized: true, inventory: 'infrastructure/ansible/playbooks/hosts/local_inventory')
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