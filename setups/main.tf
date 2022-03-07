module "subredes_publicas" {
  source               = "../modules/__GLOBAL_CONFIG__/Subnets"
  el_id_de_la_VPC      = aws_vpc.mi_red.id
  tipo_subred          = "public"
  proyecto             = var.NOMBRE_PROYECTO
  los_az               = var.AV_ZONES
  cantidad_subredes    = var.NRO_DE_SUBREDES
  rangos_cidr_subredes = var.CIDR_PUBLICOS_SUBRED
  asigna_ip_publica    = true
}

module "vm_ansible" {
  source           = "../modules/Ansible/ec2-ansible"
  llave_ssh        = aws_key_pair.mi_ssh_key.key_name
  server_role      = "ansible"
  usuario_ansible  = "ansibleadmin"
  contrasena_user  = "123"
  proyecto         = var.NOMBRE_PROYECTO
  los_IDs_subredes = module.subredes_publicas.IDs_subredes
  ip_fija_privada  = var.ip_ansible
  los_SG           = aws_security_group.mi_sec_group.id
  AZs              = var.AV_ZONES
  server_ami       = var.UBUNTU_AMI
  region           = var.REGION
  tipo_instancia   = var.TIPO_MICRO

  ip_server_debian         = var.ip_debian
  ip_server_redhat         = var.ip_redhat
  ip_server_amazonlinux    = var.ip_amazonlinux
  ip_server_ubuntu         = var.ip_ubuntu
}

module "vm_debian" {
  source           = "../modules/Debian/ec2-debian"
  llave_ssh        = aws_key_pair.mi_ssh_key.key_name
  server_role      = "debian"
  usuario_ansible  = "ansibleadmin"
  contrasena_user  = "123"
  ip_fija_privada  = var.ip_debian
  server_ami       = var.DEBIAN_AMI
  proyecto         = var.NOMBRE_PROYECTO
  los_IDs_subredes = module.subredes_publicas.IDs_subredes
  los_SG           = aws_security_group.mi_sec_group.id
  AZs              = var.AV_ZONES
  region           = var.REGION
  tipo_instancia   = var.TIPO_MICRO
}

module "vm_ubuntu" {
  source           = "../modules/Ubuntu/ec2-ubuntu"
  llave_ssh        = aws_key_pair.mi_ssh_key.key_name
  server_role      = "ubuntu"
  usuario_ansible  = "ansibleadmin"
  contrasena_user  = "123"
  ip_fija_privada  = var.ip_ubuntu
  server_ami       = var.UBUNTU_AMI
  proyecto         = var.NOMBRE_PROYECTO
  los_IDs_subredes = module.subredes_publicas.IDs_subredes
  los_SG           = aws_security_group.mi_sec_group.id
  AZs              = var.AV_ZONES
  region           = var.REGION
  tipo_instancia   = var.TIPO_MICRO
}

module "vm_redhat" {
  source           = "../modules/RedHat/ec2-redhat"
  llave_ssh        = aws_key_pair.mi_ssh_key.key_name
  server_role      = "redhat"
  usuario_ansible  = "ansibleadmin"
  contrasena_user  = "123"
  ip_fija_privada  = var.ip_redhat
  server_ami       = var.REDHAT_AMI
  proyecto         = var.NOMBRE_PROYECTO
  los_IDs_subredes = module.subredes_publicas.IDs_subredes
  los_SG           = aws_security_group.mi_sec_group.id
  AZs              = var.AV_ZONES
  region           = var.REGION
  tipo_instancia   = var.TIPO_MICRO
}

module "vm_amazonlinux" {
  source           = "../modules/AmazonLinux/ec2-amazonlinux"
  llave_ssh        = aws_key_pair.mi_ssh_key.key_name
  server_role      = "amazonlinux"
  usuario_ansible  = "ansibleadmin"
  contrasena_user  = "123"
  ip_fija_privada  = var.ip_amazonlinux
  server_ami       = var.AMAZONLINUX_AMI
  proyecto         = var.NOMBRE_PROYECTO
  los_IDs_subredes = module.subredes_publicas.IDs_subredes
  los_SG           = aws_security_group.mi_sec_group.id
  AZs              = var.AV_ZONES
  region           = var.REGION
  tipo_instancia   = var.TIPO_MICRO
}