locals {
    region = "ap-northeast-1"
    name = "test-cluster"
    vpc_cidr = "10.123.0.0./16"
    azs = ["ap-northeast-1a", "ap-northeast-1c"]
    public_subnets = ["10.123.1.0./24", "10.123.2.0/24"]
    private_subnets = ["10.123.3.0./24", "10.123.4.0/24"]
    intra_subnets = ["10.123.5.0./24", "10.123.6.0/24"]
    tags = {
        Cluster_Name = local.name
    }
}

provider "aws" {
    region = local.region
}