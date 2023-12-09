Deploy a scalable Python App docker container Connected to Mysql DataBase on Amazon Cloud Provider Using Terraform & Jenkins
In this project I will deploy a simple Python web application that interacts with high available RDS:.
- AWS Ec2 server will be in a public subnet
- RDS DataBase will be in a private subnet
Jenkinsfile:
- 1st pipeline to provision aws infrastructure using terraform
- 2nd pipeline to deploy the app to the server as a docker container

* First you need to edit in dev.tfvars and replace access-key and secret-key with your aws credentials.
Steps:
1- git clone the repo
2- run the infra-jenkins pipeline to provision the infrastructure, terraform will install docker in the ec2 server.
3- use the public IP that will be printed at the end of the pipeline in the second pipline (Jenkinsfile)
4- run the second pipeline that uses Jenkinsfile to deploy the application
Hint:
After provisining the infrastructure, use the private ssh key into jenkins GUi credentials page to be able to use sshagent that is exist in Jenkinsfile
