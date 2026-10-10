variable "aws_region" {
  description = "Región de AWS para el despliegue"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Nombre del entorno"
  type        = string
  default     = "prod"
}

variable "vpc_cidr" {
  description = "CIDR block de producción"
  type        = string
}

variable "api_min_size" {
  description = "Tamaño mínimo del Auto Scaling Group para la API"
  type        = number
}
