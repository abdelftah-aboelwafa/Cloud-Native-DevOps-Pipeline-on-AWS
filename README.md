# 🚀 End-to-End DevOps Project (Terraform + Ansible + Jenkins + EKS + Helm + Prometheus + Grafana )

## 📌 Overview

This project demonstrates a **complete production-style DevOps pipeline** using modern tools and best practices.

It automates infrastructure provisioning, configuration management, CI/CD, monitoring, and security in a fully integrated workflow.

---

## 🏗️ Architecture

### 🔹 Infrastructure (Terraform)

* VPC with public & private subnets
* EC2 instance (Jenkins & tools)
* EKS Cluster (Kubernetes)
* Managed worker nodes

### 🔹 Configuration (Ansible)

* Server provisioning & configuration
* Tool installation:

  * Jenkins
  * Docker
  * Helm
  * kubectl
  * Trivy
  * SonarQube

### 🔹 CI/CD (Jenkins)

* Triggered via GitHub
* Builds Docker image
* Pushes to registry
* Runs SonarQube analysis
* Sends email notifications

### 🔹 Monitoring (Helm)

* Prometheus (metrics)
* Grafana (dashboards)

---

## 🧰 Tech Stack

| Category      | Tools Used          |
| ------------- | ------------------- |
| IaC           | Terraform           |
| Configuration | Ansible             |
| Cloud         | AWS (EKS, EC2, VPC) |
| Containers    | Docker              |
| Orchestration | Kubernetes (EKS)    |
| CI/CD         | Jenkins             |
| Monitoring    | Prometheus, Grafana |
| Security      | Trivy, SonarQube    |

---

## 📂 Project Structure

```bash
.
├── jenkins-deployment/
│   ├── Roles/
│   └── playbook.yml
│
├── myapp/
│   └── index.html
│
├── terraform/
│   ├── .terraform/
│   ├── ec2/
│   ├── eks/
│   ├── vpc/
│   ├── ansible.tf
│   ├── backend-resources.tf
│   ├── bootstrap.tf
│   ├── main.tf
│   ├── output.tf
│   ├── provider.tf
│   └── variable.tf
│
├── Dockerfile
├── Jenkinsfile
├── run.sh
├── .gitignore
└── README.md
```

---

## 🔄 Workflow

### 1️⃣ Run the pipeline

```bash
chmod +x run.sh
./run.sh
```

### 2️⃣ Terraform

* Provisions AWS infrastructure
* Creates networking + compute + EKS
* Generates Ansible inventory

### 3️⃣ Ansible

* Configures EC2 instance
* Installs all DevOps tools
* Prepares Kubernetes environment

### 4️⃣ Jenkins Pipeline

* Triggered on GitHub push
* Builds Docker image
* Pushes image to registry
* Runs SonarQube scan
* Sends email notifications

---

## 📊 Monitoring

| Tool       | Purpose              |
| ---------- | -------------------- |
| Prometheus | Collect metrics      |
| Grafana    | Visualize dashboards |

---

## 🔐 Security

* **Trivy** → Container vulnerability scanning
* **SonarQube** → Static code analysis

---

## 📬 Notifications

* Email alerts configured in Jenkins
* Triggered on build success/failure

---

## 🚀 Usage

```bash
chmod +x run.sh
./run.sh
```

---

## ✨ Features

✔ Fully automated infrastructure
✔ End-to-End CI/CD pipeline
✔ Kubernetes deployment (EKS)
✔ Integrated monitoring stack
✔ Security scanning included

---

## 🔮 Future Improvements

* Remote backend (S3 + DynamoDB)
* Jenkins agents on Kubernetes
* Blue/Green deployments
* GitOps with ArgoCD

---

## 👨‍💻 Author

** abdelftah aboelwafa **
DevOps Engineer 🚀
