output "cluster_name" {
  description = "El nombre del clúster EKS"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint de la API del clúster"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Certificado en base64 para comunicarse con el clúster"
  value       = module.eks.cluster_certificate_authority_data
}

output "oidc_provider_arn" {
  description = "ARN del OIDC provider (usado para configurar IRSA)"
  value       = module.eks.oidc_provider_arn
}

output "cluster_security_group_id" {
  description = "Security group ID del clúster (control plane)"
  value       = module.eks.cluster_security_group_id
}
