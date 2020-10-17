variable "name" {
  type        = string
  default     = null
  description = "Nome do repositório"
}

variable "image_names" {
  type        = list(string)
  default     = []
  description = "Lista de nomes de repositórios"
}

variable "image_tag_mutability" {
    type        = string
    description = "Configuração de tagueamento do repositório e.g MUTABLE or IMMUTABLE"
    default     = "MUTABLE"
}

variable "scan_on_push" {
    description = "Define se a imagem será scaneada no momento que for feito o upload"
    default     = false
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}