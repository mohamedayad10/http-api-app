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

		stage('Deploy to aws ec2') {
	
     			 steps {
	     			 sshagent(['aws-ec2']) {
 					sh 'rsync -rvu * user@IP:~'
					sh 'ssh user@IP "cd ~ && docker-compose up -d"'
	      				}
	      			}
    		}
		

}
}
