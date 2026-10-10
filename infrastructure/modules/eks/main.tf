variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

variable "cluster_name" {
  description = "Nombre del clúster de EKS"
  type        = string
}

variable "cluster_version" {
  description = "Versión de Kubernetes (ej. 1.30)"
  type        = string
  default     = "1.30"
}

variable "vpc_id" {
  description = "ID de la VPC donde residirá el clúster"
  type        = string
}

variable "subnet_ids" {
  description = "Subredes privadas para los nodos worker"
  type        = list(string)
}

variable "node_groups" {
  description = "Configuración de los Managed Node Groups"
  type        = any
  default     = {}
}
