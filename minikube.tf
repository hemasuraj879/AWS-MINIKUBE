module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  aws_region        = "us-east-1"
  ami_image_id                     = "ami-0f3c7d07486cad139" # devops-practice which is cenots8
  cluster_name      = "roboshop"
  aws_instance_type = "t3.medium"
  # ~ --> home dir, you should have terraform.pub in your home
  ssh_public_key      = "~/roboshop.pub"          # replace with your public key name and path
  aws_subnet_id       = "subnet-063117174cf6cc11d" # any public subnet in any VPC, I am using default VPC subnet
  hosted_zone         = "suraj.website"            # replace with your domain
  hosted_zone_private = false

  tags = {
    Application = "Minikube"
  }

  addons = [
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/storage-class.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/heapster.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/dashboard.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns.yaml"
  ]
}