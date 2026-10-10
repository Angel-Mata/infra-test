variable "environment" {
  description = "Nombre del entorno (ej. dev, prod)"
  type        = string
}

variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block para la VPC"
  type        = string
}

variable "azs" {
  description = "Lista de Availability Zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "Lista de CIDRs para subredes privadas"
  type        = list(string)
}

variable "public_subnets" {
  description = "Lista de CIDRs para subredes públicas"
  type        = list(string)
}

variable "cluster_name" {
  description = "Nombre del clúster EKS para aplicar los tags correspondientes"
  type        = string
}
