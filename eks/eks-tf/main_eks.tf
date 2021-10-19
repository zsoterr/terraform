terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws        = ">= 3.22.0"
    local      = ">= 1.4"
    random     = ">= 2.1"
    kubernetes = "~> 2.0"
  }
}


 data "aws_eks_cluster" "cluster" {
   name = module.eks.cluster_id
 }

 data "aws_eks_cluster_auth" "cluster" {
   name = module.eks.cluster_id
 }

  provider "kubernetes" {
   host                   = data.aws_eks_cluster.cluster.endpoint
   cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
   token                  = data.aws_eks_cluster_auth.cluster.token
 }


module "eks" {
  source          = "terraform-aws-modules/eks/aws"

  cluster_version = "1.20"
  cluster_name    = "rzsoter_eks_using_tf"
  vpc_id          = var.aws_vpc
  count = length(var.subnets)
  write_kubeconfig = true
  kubeconfig_output_path = "./"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  worker_groups = [
    {
      name = "rzsoter-eks-tf-wg1"
      instance_type = "t2.medium"
      asg_max_size  = 2
      asg_min_size  = 1
      //public_ip = true
      subnets       = element(var.subnets,count.index)
    }
  ]

  cluster_tags = merge(
    var.default_tags,
    {
      Name = "rzsoter"
    },
  )

  tags = merge(
    var.default_tags,
    {
      Name = "rzsoter"
    },
  )
}

