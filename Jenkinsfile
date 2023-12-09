pipeline {
	agent any
	stages {

		stage("Install dependencies") {

			steps {
				sh 'pip install flask'
			}
			}

		stage("Run Tests") {

			steps {
			sh 'pytest'
			
			}

		
		}

		stage("Provisioning The Infrastructure"){
			steps {
			   dir("Terraform"){

				sh "echo 'Current Working Directory' && pwd"
				sh "terraform init"
				sh "terraform plan"
				sh "terrafrom apply --var-file=dev.tfvars -auto-approve "

			}
			}

		}

		stage("Deploy to aws ec2") {
	
     			 steps {
	     			 sshagent(['aws-ec2']) {
 					sh 'rsync -rvu * user@IP:~'
					sh 'ssh user@IP "cd ~ && docker-compose up -d"'
	      				}
	      			}
    		}
		

}
}
