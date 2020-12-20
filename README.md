# assignments
Problem Statement: Mediawiki deployment using Terraform iac with Puppet.

-Mediawiki is a free opensource media engine used by Wikipedia.MediaWiki helps collect and organize knowledge and makes it available to people. It's powerful, multilingual, extensible, customizable, reliable, and free of charge.

-Puppet is a DevOps management tool for centralizing,configuring,managing and orchestrating various applications/softwares across whole infrastructure of an organization.

-Terraform is an opensource 'infrastructure as code' tool which enables developers to use high level configuration language called hashicorp configuration language to describe the desired 'end-state' cloud infrastructure.

How to execute the code?
Pre-requisite: Terraform >=0.12 and puppet 3.8.7 or less installed
1)Run command 'Terraform init'
2)Run command 'Terraform plan -var-file "assignment.tfvars" '
3)Run command 'terraform apply -var-file "assignment.tfvars" '

Execution flow:
Terraform: provisioning of infrastructure (aws windows 2016 ec2 server)
Puppet : Installation and Deployment of mediawiki and it's dependencies.
Terraform main.tf -> userdata.tpl-> puppetapply script(installmediawiki.ps1)

Future Enhancements:
1)Packages/Binaries can be stored on artifactory/s3 bucket/azure storage container.
2)Some of the configuration changes like uncommenting and modifying ini file can be handled via puppet files instead of with userdata.(userdata should be kept light ,without much computing complexities to reduce bootstrapping overhead.)
3)Deployment of terraform code can be done through pipelines with Azure DevOps/Jenkins/AWS CodeDeploy.
4)AWS Mediawiki AMI is available in AWS Marketplace which if customized can relieve puppet of the heavylifting of downloading,installing and unzipping mediawiki package.
