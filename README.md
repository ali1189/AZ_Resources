## AZ_Resources
## Create Azure resources using ansible 

## Requirements: 

 - Oracle VM VirtualBox https://www.virtualbox.org/wiki/Downloads 
 - Vagrant https://www.vagrantup.com/downloads 

## Files: 

Vagrantfile: contains information to create the machine 

Bootstrap.sh: commands to provision the machine including install (ansible azure collection, few needed packages, Azure cli)

## Playbooks: 

Full_Create_VM_RedHat_8.1.yml  

Create a resource group in Dev environment VM RedHat with all needed components “Vnet, Subnet, NSG with basic rules we have everywhere attached on Subnet level, NIC” without Public Ip 

Create_App_Service_and ASP.yml 

Create App Service Plan in existing resource group 

Create docker web “xxx” 

Create staging slot  

## Instructions: 

From cmd or visual studio code change directory where you have Vagrantfile & bootstrap.sh 

      - vagrant status                                        -- To make sure of the vagrantfile 
      - vagrant up                                            -- It will take few minutes to create and provision the VM 

Access machine in tow ways: 

      - ssh root@192.168.56.5 Password: panda
      - From the same directory: 
                  - vagrant ssh panda, then sudo -s 

Copy playbooks under root user 

Run playbooks under root user:  

Before run playbooks you need to d some changes in both files regarding:
Docker container name & IPs in NSG 

      - ansible-playbook Full_Create_VM_RedHat_8.1.yml 
      - ansible-playbook Create_App_Service_and ASP.yml 

