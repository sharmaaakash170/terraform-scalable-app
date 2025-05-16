
# 🚀 Scalable EC2 Web App on AWS (No Docker!)

This project demonstrates a fully scalable and production-ready web application hosted on AWS EC2 instances using **Launch Templates**, **Auto Scaling Groups**, and **Application Load Balancer (ALB)** — all provisioned using **Terraform**.

## ✅ Project Highlights

- **No Docker or Containers**
- **Launch Template + Auto Scaling Group (ASG)**
- **Application Load Balancer (ALB) for traffic distribution**
- **User Data** for bootstrapping EC2 instances
- **Modular Terraform setup** with clean infrastructure definitions
- **Public and Private Subnets** with proper routing and security
- **Highly Available, Scalable, and Self-Healing Architecture**

## 📁 Folder Structure

```
terraform-scalable-app/
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── asg/
│   ├── alb/
│   └── security/
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
├── user-data.sh
└── README.md
```

## 🧠 What I Learned

- Deep understanding of EC2 networking and scaling mechanisms
- VPC setup with custom subnets and route tables
- Configuring security groups and bootstrapping using User Data
- Building a non-containerized app infrastructure using IaaC

## 🔧 Tech Stack

- **AWS EC2, ASG, ALB, VPC, IGW, Route Tables**
- **Terraform**
- **Shell Scripting** (User Data)

## 🌐 Deployment Architecture

![AWS Architecture](./architecture.png)

---

### 👋 Let’s Connect
If you're looking for someone skilled in Cloud Infrastructure and DevOps, feel free to reach out!

[LinkedIn](https://www.linkedin.com/) | [GitHub](https://github.com/)

---

#DevOps #AWS #Terraform #EC2 #CloudComputing #InfrastructureAsCode #OpenToWork
