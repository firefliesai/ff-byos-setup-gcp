# Setup

To setup byos, you need to do the following

- Create a new google cloud project. You can re-use an existing project but it is advised to create a new project just for byos.
- Create a service account to run terraform. The private key of this account stays with the customer and does not come to the fireflies team. This is exclusively for running the terraform commands
- Clone the repository
- Set all the necessary variables in terraform.tfvars file
- Run terraform apply
- Verify the changes
- Enter yes
- Wait for the configuration to apply to your project

Make sure you save the terraform.tfstate someplace safe after the apply command is successful. 

Note: The terraform configuration creates a new gcp bucket for this purpose. However, if you want to re-use an existing bucket, you can do so by either importing the bucket into terraform. 


# Variables to set

At the time of writing, customers are required to set the following variables in the terraform.tfvars file

- project_id
- bucket_name 
- credentials_file 

Please do not change the `service_account_email` variable unless fireflies team has advised you to do so. 

# File Structure

- `bucket.tf` : The bucket configuration. This is intentionally left vague to let customers decide their settings  
- `main.tf` : The entrypoint for google cloud configuration. However, the configuration is controlled by variables  
- `permissions.tf` : The file that defines permissions need for the operation  
- `terraform.tfvars` : All the variables required for the configuration to work. Customers are encouraged to change the necessary environment variables in this file to their project specific ones  


# Permissions Requested

Fireflies requires the following permissions on google cloud storage to successfully run. 

```
storage.objects.create
storage.objects.delete
storage.objects.get
storage.objects.list
storage.objects.update
storage.objects.getIamPolicy
```

These permissions are not wildcard permissions and are bound to the bucket specified by the customer.  This is defined in the condition section of the permissions.tf file



