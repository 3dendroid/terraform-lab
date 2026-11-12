# terraform-lab

My hands-on lab for learning Terraform on AWS, following the ADV-IT "Terraform на Русском Языке" course.

## Structure

| Folder | What it does |
|---|---|
| `Lesson-1/` | Creates EC2 instances (Ubuntu and Amazon Linux) in `eu-north-1`. Covers `init → plan → apply → destroy`, `count`, tags, in-place updates and drift. |
| `Lesson-2/` | A simple web server: an Ubuntu EC2 instance with nginx installed via `user_data`, and a security group that opens only port 80 (HTTP). Verified with `curl http://<public_ip>`. |
| `Lesson-3/` | The bootstrap script moved out of the `.tf` code into an external file. |
| `Lesson-4/` | `templatefile()`: the web page is rendered from a template with variables and a `for` loop; the output is checked in `terraform console` before deploying. |
| `Lesson-6/` | Lifecycle rules (`create_before_destroy`, `prevent_destroy`, `ignore_changes`) and an Elastic IP, so the web server can be replaced while keeping the same address. |

## Prerequisites

- Terraform >= 1.17 (`terraform -v`)
- An AWS account and an IAM user with an access key

## Credentials

Credentials are **never** stored in this repo. Export them in the shell before running Terraform:

```bash
export AWS_ACCESS_KEY_ID="..."
export AWS_SECRET_ACCESS_KEY="..."
```

The region is set in the code (`eu-north-1`), because the AMI IDs only exist in that region.

## Usage

```bash
cd Lesson-1         # or any other lesson folder
terraform init      # download the AWS provider
terraform plan      # preview the changes
terraform apply     # create the resources
terraform state list  # verify what Terraform manages
terraform destroy   # remove everything when done
```

> [!WARNING]
> EC2 instances cost money outside the free tier. Always run `terraform destroy` after a lesson and check that `terraform state list` is empty.

## What is not committed

- `terraform.tfstate*` — state can contain sensitive data
- `.terraform/` — downloaded provider binaries
- `*.tfvars` — variable files that may hold secrets

The `.terraform.lock.hcl` file **is** committed, so everyone gets the same provider version.