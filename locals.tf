locals {
  common_tags = {
        Name = "Roboshop"
        Environment = "Dev"
        Terraform = "true"
    }

    az_names = slice(data.aws_availability_zones.available.names, 0, 2)

  }
