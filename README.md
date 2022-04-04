Project 1: Automated ELK Stack Deployment:
The files in this repository were used to configure the network depicted below.

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either
recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

Install-elk.yml: Modifies virtual memory and enables configuration of Docker VMs in Ansible for DVWA Container.
Filebeat-config.yml: The configuration file for 
Filebeat-playbook.yml: The playbook that allows installation of Filebeat to the ELK Stack.
Metricbeat-config.yml: The configuration file for 
Metricbeat-playbook.yml: The playbook that allows installation of Metricbeat to the ELK Stack.
This document contains the following details:

Description of the Topology
Access Policies
ELK Configuration
  Beats in Use
  Machines Being Monitored
How to Use the Ansible Build

Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will have high availability, in addition to restricting access to the network.
  Load balancers protect against Distributed Denial of Service Attacks (DDoS), shifting hostile incoming network packets       elsewhere, as well as monitoring systems for potential request overload. 
  
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the permissions and system files.
  Filebeat watches for, centralizes, and forwards log data for analysis and indexing.
  Metricbeat collects operating system metrics for analysis & exporting to neighboring services for visualization.

The configuration details of each machine may be found below. Note: Use the Markdown Table Generator to add/remove values from the table.

