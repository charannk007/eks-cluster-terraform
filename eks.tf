module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.34.0"
  Cluster_Name = local.name
  cluster_endpoint_public_access = true
  cluster_addons = {
  coredns                = {}
  eks-pod-identity-agent = {}
  kube-proxy             = {}
}
  vpc_id = module.vpc.vpc_id

   eks_managed_node_group_defaults = {
    instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  }

enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
   clustername = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["m5.xlarge"]
      min_size     = 2
      max_size     = 3
      desired_size = 2
      capacity_type = "SPOT"
    }
  }


}