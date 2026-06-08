variable "location" {
  type        = string
  default     = "East US"
  description = "Região principal onde os recursos serão criados."
}

variable "environment" {
  type        = string
  default     = "lab"
  description = "Ambiente do projeto (ex: dev, lab, prod)."
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "Tamanho da máquina virtual com foco em economia."
}

variable "allowed_ssh_ip" {
  type        = string
  default     = "*" # Sugestão: Altere para o seu IP público real para maior segurança
  description = "IP permitido para acessar o SSH."
}