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
          sh '''terraform destroy -force
terraform plan'''
          sh 'terraform apply'
        }
        
      }
    }
    stage('[Ansible] Configure Platform') {
      steps {
        dir(path: './infrastructure/terraform/') {
          sh '''echo "[workshop_servers]" > ../ansible/playbooks/hosts/qa_inventory
terraform output EC2_1.ip >> ../ansible/playbooks/hosts/qa_inventory
terraform output EC2_2.ip >> ../ansible/playbooks/hosts/qa_inventory'''
        }
        
        dir(path: './infrastructure/ansible/playbooks') {
          ansiblePlaybook(playbook: 'provision_server.yml', colorized: true, extras: '--check --private-key ../../terraform/resources/private_key.pem', installation: 'ansible-latest', inventory: 'hosts/qa_inventory')
        }
        
      }
    }
  }
}