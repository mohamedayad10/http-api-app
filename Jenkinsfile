pipeline {
	agent any
	stages {

		stage("Deploy to aws ec2") {
	
     			 steps {
	     			 sshagent(['aws-ec2']) {
 					sh 'rsync -rvu * ec2-user@IP:~'
					sh 'ssh ec2-user@IP "cd ~ && docker-compose up -d"'
	      				}
	      			}
    		}
		

}
}
