# Demo Laravel Application on EKS

This repository contains a demo Laravel application configured for deployment on Amazon Elastic Kubernetes Service (EKS). The application leverages AWS services such as ECR for container image storage, Jenkins for CI/CD, and an ALB for ingress.

## Table of Contents

1. [Local Setup](#local-setup)
2. [CI/CD Pipeline](#cicd-pipeline)
3. [Infrastructure Provisioning with Terraform](#infrastructure-provisioning-with-terraform)
4. [Kubernetes Deployment](#kubernetes-deployment)
5. [Verification](#verification)
6. [Application URL](#application-url)

---

## Local Setup

To set up and run the application locally:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/godwiniheuwa/demo-laravel-eks.git
   cd demo-laravel-eks

---

## 2. CI/CD Pipeline

To trigger the CI/CD pipeline using Jenkins:

1. **Access the Jenkins dashboard:**
   Navigate to the Jenkins URL: [http://3.88.32.141:8080/](http://3.88.32.141:8080/).

2. **Set up credentials:**
   - Configure AWS credentials to allow Jenkins to push the Docker image to Amazon ECR.
   - Ensure ECR repository access is correctly configured in Jenkins.

3. **Trigger the pipeline:**
   - Push changes to the GitHub repository.
   - Alternatively, manually trigger the pipeline from the Jenkins dashboard.

### CI/CD Stages

- **Build:** Jenkins builds the Docker image for the Laravel application and pushes it to Amazon ECR.
- **Test:** The pipeline runs the Laravel application's automated test suite.
- **Deploy:** Deploys the built container to the EKS cluster using `kubectl`.

---

## 3. Infrastructure Provisioning with Terraform

To provision the infrastructure using Terraform:

1. **Navigate to the Terraform directory:**
   ```bash
   cd EKSCluster

2. **Initialize Terraform:**
   Initialize the working directory for Terraform:
   ```bash
   terraform init


   