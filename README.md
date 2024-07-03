
-------------------------------------
Project: Deploy a Static Website on AWS using Terraform


Objective:
Create an AWS infrastructure to host a static website using Terraform. The infrastructure will include AWS S3 for storing the website files, CloudFront for content delivery, and Route 53 for domain name management. Additional configurations will involve setting up IAM roles and policies, API Gateway, and SSL certificates.


Prerequisites:
AWS Account
Domain name registered in Route 53


File Structure
├── api_gateway_config.tf
├── api_gateway_resources.tf
├── certificate.tf
├── data.tf
├── init.tf
├── main.tf
├── outputs.tf
├── permissions.tf
├── README.md
├── route53.tf
├── variables.tf
└── s3-static-website.png

Files Description:
api_gateway_config.tf: Configuration for API Gateway.
api_gateway_resources.tf: API Gateway resources definition.
certificate.tf: SSL certificate configuration.
data.tf: Data sources for Terraform.
init.tf: Initialization configuration for Terraform.
main.tf: Main infrastructure setup.
outputs.tf: Outputs for Terraform.
permissions.tf: IAM roles and policies.
README.md: Project documentation.
route53.tf: Route 53 DNS configuration.
variables.tf: Variables used in the Terraform project.
s3-static-website.png: Diagram of the infrastructure.


Tasks:
1. Initialize the Terraform Project
Run terraform init to initialize the Terraform project.
Ensure all necessary providers and modules are installed.

2. Configure AWS S3 Bucket
Create an S3 bucket to host the static website.
Configure the bucket policy to make it publicly accessible.
Define the index.html and error.html as the default documents.

3. Set Up CloudFront Distribution
Create a CloudFront distribution to serve the content from the S3 bucket.
Configure the default_root_object to point to index.html.
Integrate the SSL certificate for HTTPS.

4. Manage Domain with Route 53
Configure Route 53 to manage the custom domain.
Create DNS records to point to the CloudFront distribution.

5. Security and Access Management
Define IAM roles and policies to secure the S3 bucket and CloudFront distribution.
Implement least privilege access for IAM roles.

6. API Gateway Configuration
Configure API Gateway for handling HTTP requests.
Define necessary resources and methods in api_gateway_resources.tf.

7. SSL Certificate Configuration
Request and validate an SSL certificate using ACM.
Attach the SSL certificate to the CloudFront distribution.

8. Deployment and Testing
Deploy the infrastructure using terraform apply.
Verify the deployment by accessing the website via the custom domain.
Documentation
Ensure the README.md file contains detailed instructions on setting up and deploying the infrastructure, including prerequisites, steps to run Terraform commands, and verification steps.


You have to deploy the resources as a module


module "s3_bucket" {
name: name_of_bucket
other config
}


module "cloudfront" {
config ...
}
