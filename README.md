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



## 3. Infrastructure Provisioning with Terraform

To provision the infrastructure using Terraform:

1. **Navigate to the Terraform directory:**
   ```bash
   cd EKSCluster

2. **Initialize Terraform:**
   Initialize the working directory for Terraform:
   ```bash
   terraform init

3. **Review the Terraform plan:**
   Generate and review the execution plan:
   ```bash
   terraform plan

4. **Apply the configuration:**
   Deploy the AWS resources required for the application:
   ```bash
   terraform apply

This Terraform configuration will provision the following infrastructure:

- An EKS cluster for Kubernetes workloads.
- A VPC, subnets, and necessary networking configurations.
- IAM roles and policies for EKS and application permissions.
- An AWS Application Load Balancer for external access to the application.

## Kubernetes Deployment
- To deploy the Laravel application to Kubernetes:

**Configure kubectl:**
   Update your local kubeconfig to point to the EKS cluster:

   ```bash
   aws eks --region <your-region> update-kubeconfig --name <cluster-name>

**Deploy the application manifests:**
   Apply the Kubernetes manifests located in the k8s directory:

   ```bash
   kubectl apply -f k8s/

**Verify the deployment:**
   Check that the application pods are running:

   ```bash
   kubectl get pods

## Verification
To confirm the application is running successfully:

** Verify pod status:**
Ensure all pods are in the Running state:

 ```bash
kubectl get pods

**Check service details:**
   Confirm that the Kubernetes service is exposing the application:

   ```bash
   kubectl get services

Access the application:
Open the Load Balancer URL in your browser. The application should be accessible and functional.

**Application URL**
The deployed Laravel application is accessible at the following URL:

http://k8s-ingressalb-88dae34828-1620760516.us-east-1.elb.amazonaws.com/

For troubleshooting, you can inspect Kubernetes logs:

   ```bash
   kubectl logs <pod-name>
