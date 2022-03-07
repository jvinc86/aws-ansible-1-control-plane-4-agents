variable "REGION" { default = "eu-west-3" }            #OJO si se modifica la region deben adaptarse abajo los AV_ZONES
variable "BLOQUE_CIDR_VPC" { default = "10.80.0.0/16" } #OJO si se modifica la VPC deben adaptarse abajo los CIDR_SUBRED

variable "NOMBRE_PROYECTO" { default = "Ansible" }
variable "RUTA_LLAVE_PUBLICA" { default = "C:/Users/jvinc/.ssh/id_rsa.pub" }

variable "NRO_DE_SUBREDES" { default = 1 } #OJO si se modifica este numero, tambien debe modificarse/adaptarse las variables de abajo 
variable "AV_ZONES" { default = ["eu-west-3a", "eu-west-3b", "eu-west-3c"] }
variable "CIDR_PRIVADOS_SUBRED" { default = ["10.80.0.0/24", "10.80.1.0/24", "10.80.2.0/24"] }
variable "CIDR_PUBLICOS_SUBRED" { default = ["10.80.3.0/24", "10.80.4.0/24", "10.80.5.0/24"] }

variable "ip_ansible" { default = "10.80.3.100" }
variable "ip_redhat" { default = "10.80.3.20" }
variable "ip_amazonlinux" { default = "10.80.3.21" }
variable "ip_debian" { default = "10.80.3.30" }
variable "ip_ubuntu" { default = "10.80.3.31" }

variable "TIPO_MICRO" { default = "t2.micro" }
variable "TIPO_PEQUENA" { default = "t2.small" }
variable "TIPO_MEDIANA" { default = "t2.medium" }
variable "TIPO_GRANDE" { default = "t2.large" }

variable "WIN_SERVER_AMI" {
  type = map(string)
  default = {
    us-east-1 = "ami-0d80714a054d3360c", # WindowsServer (Northern Virginia)
    us-west-1 = "ami-0fc6888a6bb1dfba6", # WindowsServer (California)
    eu-west-3 = "ami-05fb43e0cf8358e9a"  # WindowsServer (Paris)
  }
}

variable "UBUNTU_AMI" {
  type = map(string)
  default = {
    us-east-1 = "ami-04505e74c0741db8d", # Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
    us-west-1 = "ami-01f87c43e618bf8f0", # Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
    eu-west-3 = "ami-0c6ebbd55ab05f070"  # Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
  }
}

variable "REDHAT_AMI" {
  type = map(string)
  default = {
    us-east-1 = "ami-0b0af3577fe5e3532", # Red Hat Enterprise Linux 8 (HVM), SSD Volume Type
    us-west-1 = "ami-054965c6cd7c6e462", # Red Hat Enterprise Linux 8 (HVM), SSD Volume Type
    eu-west-3 = "ami-08755c4342fb5aede"  # Red Hat Enterprise Linux 8 (HVM), SSD Volume Type
  }
}

variable "DEBIAN_AMI" {
  type = map(string)
  default = {
    us-east-1 = "ami-07d02ee1eeb0c996c", # Debian 10 (HVM), SSD Volume Type
    us-west-1 = "ami-0528712befcd5d885", # Debian 10 (HVM), SSD Volume Type
    eu-west-3 = "ami-04e905a52ec8010b2"  # Debian 10 (HVM), SSD Volume Type
  }
}

variable "AMAZONLINUX_AMI" {
  type = map(string)
  default = {
    us-east-1 = "ami-0c293f3f676ec4f90", # Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type
    us-west-1 = "ami-051317f1184dd6e92", # Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type
    eu-west-3 = "ami-01d14e0ab732be0e4"  # Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type
  }
}
# variable "CANTIDAD_INSTANCIAS" { default = 3 }
# variable "INSTANCE_USERNAME" { default = "vincent" }
# variable "INSTANCE_PASSWORD" { default = "Password!1234" }