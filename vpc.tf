resource "aws_vpc" "main" {
    cidr_block = var.cidr_block[0]
    instance_tenancy = "default"
    enable_dns_hostnames = true

    tags = var.tags
}

resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id 

    tags = merge(
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}"
        }
    )
  
}

resource "aws_subnet" "public" {
    count = length(var.private_subnet_cidrs)
    vpc_id = aws_vpc.main.id 
    cidr_block = var.public_subnet_cidrs[count.index]
    map_public_ip_on_launch = true

    availability_zone = local.az_names[count.index]

    tags = merge(
        local.common_tags,
        {
           Name = "${var.project_name}-${var.environment}-public-${local.az_names[count.index]}"
        }
    )
  
}

resource "aws_subnet" "private" {
    count = length(var.private_subnet_cidrs)
    vpc_id = aws_vpc.main.id 
    cidr_block = var.private_subnet_cidrs[count.index]
    map_public_ip_on_launch = true
    tags = merge(
        local.common_tags,
        {
           Name = "${var.project_name}-${var.environment}-private-${local.az_names[count.index]}"
        }
    )
  
  
}

resource "aws_subnet" "database" {
    count = length(var.database_subnet_cidrs)
    vpc_id = aws_vpc.main.id 
    cidr_block = var.database_subnet_cidrs[count.index]
    map_public_ip_on_launch = true
   tags = merge(
        local.common_tags,
        {
           Name = "${var.project_name}-${var.environment}-database-${local.az_names[count.index]}"
        }
    )
  
  
}

