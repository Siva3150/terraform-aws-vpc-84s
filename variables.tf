variable "cidr_block" {
    default = "10.0.0.0/16"
}

# variable "common_tags" {
#     default = {
#         Name = "Roboshop"
#         Environment = "Dev"
#         Terraform = "true"
#     }
# }

variable "project_name" {
 type = string
}

variable "environment" {
 type = string
}

variable "vpc_tags" {
    type = map(string)
    default = {}
}

variable "igw_tags" {
    type = map(string)
    default = {}
}

variable "public_subnet_tags" {
    type = map(string)
    default = {}
}

variable "private_subnet_tags" {
    type = map(string)
    default = {}
}

variable "database_subnet_tags" {
    type = map(string)
    default = {}
}

variable "public_subnet_cidrs" {
    type = list(string)
    #default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
    type = list(string)
    #default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "database_subnet_cidrs" {
    type = list(string)
    #default = ["10.0.21.0/24", "10.0.22.0/24"]
}

variable "eip_tags" {
    type = map(string)
    default = {}
}

variable "nat_gateway_tags" {
    type = map(string)
    default = {}
}

variable "public_route_table_tags" {
    type = map(string)
    default = {}
}

variable "private_route_table_tags" {
    type = map(string)
    default = {}
}

variable "databse_route_table_tags" {
    type = map(string)
    default = {}
}

variable "is_peering_required" {
    default = false
}

variable "peering_tags" {
    type = map(string)
    default = {}
}