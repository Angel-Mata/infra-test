output "vpc_id" {
  description = "ID de la VPC"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Lista de IDs de las subredes privadas"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Lista de IDs de las subredes públicas"
  value       = module.vpc.public_subnets
}
