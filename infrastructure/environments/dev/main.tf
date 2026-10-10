locals {
  environment  = "dev"
  cluster_name = "catalog-api-cluster-${local.environment}"
}

module "network" {
  source = "../../modules/network"

  environment     = local.environment
  vpc_name        = "vpc-catalog-${local.environment}"
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  cluster_name    = local.cluster_name
}

module "eks" {
  source = "../../modules/eks"

  environment     = local.environment
  cluster_name    = local.cluster_name
  vpc_id          = module.network.vpc_id
  subnet_ids      = module.network.private_subnets

  node_groups = {
    # Nodos para la API de Catálogo
    api_nodes = {
      min_size     = 2
      max_size     = 5
      desired_size = 3
      instance_types = ["t3.medium"]
      labels = {
        role = "api"
      }
    }
    # Nodos dedicados para la Base de Datos PostgreSQL
    db_nodes = {
      min_size     = 2
      max_size     = 3
      desired_size = 2
      instance_types = ["m5.large"]
      labels = {
        role = "database"
      }
      # Opcional: Taints para asegurar que solo los pods de DB se programen aquí
      taints = {
        dedicated = {
          key    = "dedicated"
          value  = "database"
          effect = "NO_SCHEDULE"
        }
      }
    }
  }
}
