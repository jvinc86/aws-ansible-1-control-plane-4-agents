resource "aws_instance" "mis_vms" {
  ami                         = var.server_ami[var.region] #var.imagen_OS 
  instance_type               = var.tipo_instancia
  availability_zone           = var.AZs[0]
  # subnet_id                   = var.los_IDs_subredes[count.index]
  user_data                   = data.template_file.userdata_linux.rendered
  key_name                    = var.llave_ssh
  tags                        = { Name = "srv-${var.server_role}" }

  network_interface {
    network_interface_id = "${aws_network_interface.mi_nic.id}"
    device_index = 0
  }
}

resource "aws_network_interface" "mi_nic" {
  subnet_id = var.los_IDs_subredes[0]
  private_ips = [var.ip_fija_privada]
  security_groups = [var.los_SG]
}

data "template_file" "userdata_linux" {
  template = <<-EOT
                #!/bin/bash
                INICIO=$(date "+%F %H:%M:%S")
                echo "Hora de inicio del script: $INICIO" > /home/admin/a_${var.server_role}.txt

                sudo timedatectl set-timezone Europe/Paris
                
                hostnamectl set-hostname ${var.server_role}
                echo "admin:${var.contrasena_user}" | sudo chpasswd

                sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
                sudo sed -i 's/^#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
                sudo service sshd restart

                cat <<EOF | sudo tee /etc/motd

                ######                                     #     ###
                #     # ###### #####  #   ##   #    #     ##    #   #
                #     # #      #    # #  #  #  ##   #    # #   #     #
                #     # #####  #####  # #    # # #  #      #   #     #
                #     # #      #    # # ###### #  # #      #   #     #
                #     # #      #    # # #    # #   ##      #    #   #
                ######  ###### #####  # #    # #    #    #####   ###
                
                EOF

                #Agregar otro usuario para que administre Ansible
                usuario=${var.usuario_ansible}
                sudo useradd -U $usuario -m -s /bin/bash -p ${var.contrasena_user} -G sudo
                echo "$usuario:${var.contrasena_user}" | sudo chpasswd

                #Evitar que pida el password a cada rato para usuarios que sean parte del grupo sudo
                sed -i /etc/sudoers -re 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g'
                sed -i /etc/sudoers -re 's/^#includedir.*/## Removed the #include directive! ##"/g'

                #Agregar a los archivos sudoers este nuevo usuario
                echo "$usuario ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
                echo "$usuario ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/90-cloud-init-users

                sudo apt update -y && sudo apt upgrade -y && sudo apt install tree -y

                

                echo "El rol de este servidor es: ${var.server_role}" > /home/admin/b_${var.server_role}.txt
                FINAL=$(date "+%F %H:%M:%S")
                echo "Hora de finalizacion del script: $FINAL" >> /home/admin/a_${var.server_role}.txt

              EOT
}

