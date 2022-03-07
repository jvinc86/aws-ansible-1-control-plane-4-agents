# output "El_ID_VPC" { value = aws_vpc.mi_red.id }
# output "Router_Nuevo_ID_VPC" { value = aws_vpc.mi_red.main_route_table_id }
# output "Los_IDs_subredes" { value = module.subredes_publicas.IDs_subredes }

output "Ip_privada_Server_ANSIBLE" { value = module.vm_ansible.mis_ip_privadas }
output "Ip_PUBLICA_Server_ANSIBLE" { value = module.vm_ansible.mis_ip_publicas }

output "Ip_privada_Server_DEBIAN" { value = module.vm_debian.mis_ip_privadas }
output "Ip_PUBLICA_Server_DEBIAN" { value = module.vm_debian.mis_ip_publicas }

output "Ip_privada_Server_UBUNTU" { value = module.vm_ubuntu.mis_ip_privadas }
output "Ip_PUBLICA_Server_UBUNTU" { value = module.vm_ubuntu.mis_ip_publicas }

output "Ip_privada_Server_AMAZONLINUX" { value = module.vm_amazonlinux.mis_ip_privadas }
output "Ip_PUBLICA_Server_AMAZONLINUX" { value = module.vm_amazonlinux.mis_ip_publicas }

output "Ip_privada_Server_REDHAT" { value = module.vm_redhat.mis_ip_privadas }
output "Ip_PUBLICA_Server_REDHAT" { value = module.vm_redhat.mis_ip_publicas }


