FROM ubuntu:latest

# Instalamos servicios necesarios
RUN apt-get update && apt-get install -y openssh-server sudo python3

# Configuramos el usuario 'ansible'
RUN useradd -m -s /bin/bash ansible && \
    echo "ansible:ansible" | chpasswd && \
    echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Configuración de SSH
RUN mkdir /var/run/sshd
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]