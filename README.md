# Infrastructure as Code (IaC) - CloudFormation and Terraform

This repository contains Infrastructure as Code (IaC) for deploying resources on AWS (CloudFormation) and DigitalOcean (Terraform). The project covers the following assessments:

1. **Assessment 1** - AWS CloudFormation
2. **Assessment 2** - Terraform on DigitalOcean

## Assessment 1: AWS CloudFormation (YAML/JSON)

This assessment involves creating an AWS CloudFormation template to deploy EC2 instances with the following setup:

- **EC2 Instances**:
  - EC2 1: LAMP stack installed
  - EC2 2 and EC2 3: No LAMP stack installed
- **Security Group**: Configured to allow SSH (port 22) and HTTP (port 80) inbound traffic.
  
### Steps for AWS CloudFormation Deployment

1. **CloudFormation Template**:
   - The template is written in YAML/JSON format and defines the necessary AWS resources like EC2 instances, security groups, and LAMP stack installation for one of the EC2 instances.

2. **Parameters**:
   - You can specify instance types from a list of available values (e.g., `t2.micro`, `t2.nano`, `t2.medium`).
   - The LAMP stack installation is included in the `UserData` section for the first EC2 instance.

3. **Screenshots to Include**:
   - **CloudFormation Stack Details Page**: Showing all resources created.
   - **EC2 1**: LAMP stack installed and running.
   - **EC2 2 and EC2 3**: Without LAMP stack installed.
   - **AWS Management Console**: Verifying instance type and key pair match the specified parameters.
   - **Security Group Settings**: Confirming inbound rules allow SSH (port 22) and HTTP (port 80).
   - **Bonus Screenshot 1**: Verify that the default Apache page appears for EC2 with LAMP (Working).
   - **Bonus Screenshot 2**: Demonstrate that a user can dynamically choose the EC2 instance type (Working).

---

## Assessment 2: Terraform on DigitalOcean

In this assessment, we use **Terraform** to deploy resources on **DigitalOcean**. The following resources are provisioned:

- **Droplet 1**: Ubuntu 24.10 in the Singapore region with Nginx installed.
- **Droplet 2**: Ubuntu 20.04 in the NYC region with an attached 10GB block storage volume.

### Steps for Terraform Deployment

1. **Configuration**:
   - The `terraform.tf` configuration file is used to create two Droplets with specific setups.
     - Droplet 1: Ubuntu 24.10 with Nginx installation using `user_data` script.
     - Droplet 2: Ubuntu 20.04 with additional block storage attached.
   - A **firewall** is created to allow inbound traffic on ports 22 (SSH) and 80 (HTTP) for both Droplets.

2. **Screenshots to Include**:
   - **Terraform Console Output**: Showing successful deployment of Droplets.
   - **Droplet 1**: Ubuntu 24.10, Singapore region with Nginx installed.
   - **Droplet 2**: Ubuntu 20.04, NYC region with 10GB block storage attached.
   - **Cloud Provider Console**: Showing the provisioned DigitalOcean Droplets.
   - **Bonus Screenshot 1**: Verify that the default Nginx page appears for Droplet 1 (Working).

### Terraform Deployment Steps

1. **Clone the repository**:
    ```bash
    git clone <your-repository-url>
    cd <your-directory>
    ```

2. **Set up the environment**:
    - For DigitalOcean: Ensure you have a valid API token and set it in a `.tfvars` file.
    - For AWS (if applicable): Configure your credentials via environment variables or the AWS credentials file.

3. **Initialize Terraform**:
    ```bash
    terraform init
    ```

4. **Validate the Terraform configuration**:
    ```bash
    terraform validate
    ```

5. **Apply the Terraform plan**:
    ```bash
    terraform apply
    ```
    Type `yes` to confirm and start provisioning the resources.

---

## Assessment 3: GitHub Hosting

This repository is hosted on GitHub. You can access the complete code and instructions here:

[GitHub Repository Link](https://github.com/TSJean45/iac-cloud-practitioner)

---

## Conclusion

This project demonstrates the use of **Infrastructure as Code (IaC)** to automate cloud resource provisioning and configuration:

- **AWS CloudFormation**: Provision EC2 instances and configure security settings.
- **Terraform on DigitalOcean**: Create Droplets with custom configurations, attach block storage, and configure firewalls.

Both approaches ensure infrastructure can be managed consistently, reproducibly, and at scale.


