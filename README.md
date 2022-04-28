--**Project 1: Automated ELK Stack Deployment:**--

The files in this repository were used to configure the network depicted below.

![image](https://github.com/UCB-CyberSecurity-Cohort5/elk-stack-project-nrt-cyber-1991/blob/main/Diagrams/ELK%20Stack%20Network%20Topology%20Chart.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either
recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

* [Install-elk.yml](https://github.com/UCB-CyberSecurity-Cohort5/elk-stack-project-nrt-cyber-1991/blob/main/Ansible/install-elk.yml): Modifies virtual memory and enables configuration of Docker VMs in Ansible for DVWA Container.
* [Filebeat-config.yml](https://github.com/UCB-CyberSecurity-Cohort5/elk-stack-project-nrt-cyber-1991/blob/main/Ansible/filebeat-config.yml): The configuration file for 
* [Filebeat-playbook.yml](https://github.com/UCB-CyberSecurity-Cohort5/elk-stack-project-nrt-cyber-1991/blob/main/Ansible/filebeat-playbook.yml): The playbook that allows installation of Filebeat to the ELK Stack.
* [Metricbeat-config.yml](https://github.com/UCB-CyberSecurity-Cohort5/elk-stack-project-nrt-cyber-1991/blob/main/Ansible/metricbeat-config.yml): The configuration file for 
* [Metricbeat-playbook.yml](https://github.com/UCB-CyberSecurity-Cohort5/elk-stack-project-nrt-cyber-1991/blob/main/Ansible/metricbeat-playbook.yml): The playbook that allows installation of Metricbeat to the ELK Stack.
* [Pentest.yml](https://github.com/UCB-CyberSecurity-Cohort5/elk-stack-project-nrt-cyber-1991/blob/main/Ansible/pentest.yml): 

This document contains the following details:

* Description of the Topology
* Access Policies
* ELK Configuration
  * Beats in Use
  * Machines Being Monitored
* How to Use the Ansible Build


--**Description of the Topology**--

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will have high availability, in addition to restricting access to the network. Load balancers protect against Distributed Denial of Service Attacks (DDoS), shifting hostile incoming network packets elsewhere, as well as monitoring systems for potential request overload. 
  
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the permissions and system files.
* Filebeat watches for, centralizes, and forwards log data for analysis and indexing.
* Metricbeat collects operating system metrics for analysis & exporting to neighboring services for visualization.

The configuration details of each machine may be found below.

| Name       | Function                                  | IP Address | Operating System     |
|------------|-------------------------------------------|------------|----------------------|
| ELK-Server | Facilitation of Elastic, Logstash, Kibana | 10.1.0.4   | Ubuntu 18.04 (Linux) |
| Jump Box   | Gateway                                   | 10.0.0.1   | Ubuntu 18.04 (Linux) |
| Web-1      | Container for DVWA                        | 10.0.0.5   | Ubuntu 18.04 (Linux) |
| Web-2      | Container for DVWA                        | 10.0.0.6   | Ubuntu 18.04 (Linux) |
| Web-3      | Container for DVWA                        | 10.0.0.7   | Ubuntu 18.04 (Linux) |


--**Access Policies**--

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
* 50.18.75.167.

Machines within the network can only be accessed by connecting to the jumpbox with a valid SSH key with a whitelisted private IP address..
* The Jumpbox was the machine that was configured & allowed to access the ELK VM.
* The Jumpbox’s public IP address is 40.78.52.137, and its private IP address is 10.0.0.4.

A summary of the access policies in place can be found in the table below.

| Name       | Publicly Accessible | Allowed IP Addresses |
|------------|---------------------|----------------------|
| ELK-Server | No                  | 10.0.0.4             |
| Jump Box   | No                  | 50.18.75.167         |
| Web-1      | No                  | 10.0.0.4             |
| Web-2      | No                  | 10.0.0.4             |
| Web-3      | No                  | 10.0.0.4             |


--**Elk Configuration**--

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because:
* The automated scripts built increase scalability, meaning it can be used on any number of machines to deploy additional ELK stacks as needed or as an organization grows.

The playbook implements the following tasks:
* We begin by creating a virtual network, with machines in a different region than our Web/Jumpbox network of machines. 
* A peering is then created to connect them, and the same resource group must be used on the original virtual machine.
* Afterwards, a new VM is created, and the IP address of this VM is added to the Jumpbox’s ansible host files.
* Finally, a playbook for Docker.io & python3-pip installation is created & tested in the container.

The following screenshot displays the result of running docker ps after successfully configuring the ELK instance.
  Update the path with the name of your screenshot of docker ps output


--**Target Machines & Beats**--

This ELK server is configured to monitor the following machines:
* Web-1 (10.0.0.5)
* Web-2 (10.0.0.6)
* Web-3 (10.0.0.7)

We have installed the following Beats on these machines:
* Filebeat & Metricbeat are successfully installed.

These Beats allow us to collect the following information from each machine:  
* Winlogbeat collects Windows logs, which we use to track user logon events, etc.
* Metricbreat collects & logs systems files for system level analysis.
* Filebeat monitors location files.


--**Using the Playbook**--

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: SSH into the control node and follow the steps below:
* Copy the file to Ansible configuration file to /etc/ansible to begin the process of running the created playbook(s).
* Update the Ansible host file to include the internal addresses of all web & ELK stack servers.
* Run the playbook, and navigate to the Kibana web page to check that the installation worked as expected.

Which file is the playbook? Where do you copy it? 
* “Install-elk.yml” is the playbook file, which was copied to the /ansible   directory.

Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on? 
* You must update the filebeat-config.yml file, specifying the host IP address for Kibana.

Which URL do you navigate to in order to check that the ELK server is running?
* http://[ELKSERVER_ipaddress]:5601/app/kibana/home

As a Bonus, provide the specific commands the user will need to run to download the playbook, update the files, etc.
* ssh redadmin@jump-box-ip-address
* sudo docker pull [name of container]
* sudo docker run [name of container] bash
* sudo docker start [name of container]
* sudo docker attach [name of container]
* cd /etc/ansible
* nano ansible.cfg to specify the remote user.
* ansible-playbook [name of playbook]

--**References**--

An overview about how to maintain cloud security & access control in the context of this project can be found here.

[Cloud Access Control](https://github.com/UCB-CyberSecurity-Cohort5/elk-stack-project-nrt-cyber-1991/blob/main/Project%201_%20Interview%20Questions_%20Cloud%20Security.pdf)
