# Static Website on AWS using Terraform

This project deploys a static website using AWS S3, CloudFront, and Route 53 managed with Terraform.

# Documentation

1. create my S3 bucket made made sure to upload my website content in the root
   ![s3-bucket](Screenshot%202024-06-28%20at%207.51.32%E2%80%AFPM.png)
2. Created my cloudfront ![cloudfront](Screenshot%202024-06-28%20at%207.51.55%E2%80%AFPM.png)
3. created my origin access control so i can add it to my s3-bucket policy
   ![oac_cloudfront](Screenshot%202024-06-28%20at%207.51.55%E2%80%AFPM.png)
4. Attach the policy to my s3 when creating my cloud front
5. Went to my AWS console to check if cloud front can serve my page since i blocked public access on my s3-bucket, and it worked
   ![website](Screenshot%202024-05-09%20at%209.36.13%E2%80%AFPM.png)
6. Created my route53 hosted zone with my domain name
   ![hosted-zone](Screenshot%202024-06-28%20at%208.08.36%E2%80%AFPM.png)

7. requested for the certificate
   ![certificate](Screenshot%202024-06-28%20at%208.09.10%E2%80%AFPM.png)
