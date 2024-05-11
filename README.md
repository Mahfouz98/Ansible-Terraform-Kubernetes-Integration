# Automating the creation and deployment of a Kubernetes cluster on AWS EC2 instances ⚡
![maxresdefault](https://github.com/Mahfouz98/Ansible-Terraform-Kubernetes-Integration/assets/145352617/f3e087ee-740e-4a7e-92d0-59b69c8e8d8c)

---

## Overview ☀️
This repository contains the necessary automation scripts to provision a Kubernetes cluster from scratch on AWS EC2 instances. It leverages Terraform for infrastructure provisioning and Ansible for automating Kubernetes cluster deployment.

## Architecture 🔻

```
loco@loco-Inspiron-3576:~/projects/Ansible-Kubernetes$ tree
.
├── ansible.cfg
├── Cluster-by-Bash-Script
│   ├── commonscript.sh
│   └── masterscript.sh
├── inventory
│   └── hosts.txt
├── main-playbook.yaml
├── roles
│   ├── master-node
│   │   └── tasks
│   │       └── main.yaml
│   └── worker-node
│       └── tasks
│           └── main.yaml
└── terraform
    ├── backend.tf
    ├── ec2.tf
    ├── network.tf
    ├── outputs.tf
    ├── provider.tf
    ├── routetable.tf
    ├── securitygroup.tf
    └── variables.tf

```




# Prerequisites ✔️
- AWS Account with access to EC2, VPC.
- Terraform installed on your local machine.
- Ansible installed on your local machine.
-  #### SSH keypair for EC2 instance access. This is Important Because i have downloaded the keypair in this path
-  https://github.com/Mahfouz98/Ansible-Terraform-Kubernetes-Integration/blob/dc08fadba91664ec370d80287c7bc364e0a093c8/roles/master-node/tasks/main.yaml#L155
-  #### Please Change this location in the project for your desired path.
   
- S3 bucket to save the statefile in, in mycase you can check 

## Quick Start 🤜

1. Clone the repository:
   `git clone https://github.com/Mahfouz98/Ansible-Terraform-Kubernetes-Integration`

2. Navigate to the Terraform directory 
   ` cd terraform `
   
3. Create S3 bucket and Change the name of variable `BUCKETNAME` in `/terraform/variables.tf`
   
4. <a href="https://github.com/Mahfouz98/Ansible-Terraform-Kubernetes-Integration/blob/main/terraform/variables.tf" target="_blank">Check variables.tf</a>
   
5. initialize the Terraform environment
   ` terraform init `
6. Now Everything is read to apply
   `terraform apply --auto-approve`
   
7. Grab a cup of coffee until this ends. ☕

   
![Screenshot from 2024-05-11 22-31-30](https://github.com/Mahfouz98/Ansible-Terraform-Kubernetes-Integration/assets/145352617/7a12dd91-730e-4be5-ae8f-860af8847893)


## Once the infrastructure is provisioned, update the Ansible hosts file with the new EC2 instance IP addresses:

- You can Navigate to the hosts file by this command
  `vi ../inventory/hosts.txt`
- Assuming you are in terraform directory

### Update the hosts file <a href="https://github.com/Mahfouz98/Ansible-Terraform-Kubernetes-Integration/blob/main/inventory/hosts.txt" target="_blank">Here</a>

#### If you cleared the shell by wrong you still can get the IPs by the following commands
```
terraform output -raw master-node-ip 
terraform output -raw worker-node-ip
```

## Action Time ! ✴️ 

- First Navigate to main project directory
- `cd ..` if you are still in terraform directory.
  
- ### Then Run the Magical Command 🌠
  ```
   ansible-playbook main-playbook.yaml -i inventory/hosts.txt
  ```
- Now give him like 10 Mins to Get everything done.

### Like This
  ![Screenshot from 2024-05-11 22-29-10](https://github.com/Mahfouz98/Ansible-Terraform-Kubernetes-Integration/assets/145352617/8a9f7634-bee4-4cc4-8bdf-dc928c8e425d)


## Check the Magic. 🔍

### Go to your Terminal and ssh to the master node 
```
chmod 400 <keypair file location>
ssh -i <keypair location> ubuntu@<instanceip>
```
### then check the kubernetes nodes
```
sudo kubectl get nodes
```

![Screenshot from 2024-05-11 22-29-57](https://github.com/Mahfouz98/Ansible-Terraform-Kubernetes-Integration/assets/145352617/ff9df7cd-0cd7-4656-977a-061c31df84e4)

---

## Acknowledgments🙏 

**Thank you** for taking the time to explore our Ansible-Terraform-Kubernetes integration project. Your interest and support are greatly appreciated.

If you have any questions, encounter any issues, or simply want to discuss the project further, please feel free to reach out. We are committed to providing assistance and improving the project with your valuable feedback.

---

With gratitude,

Mahfouz 👷


