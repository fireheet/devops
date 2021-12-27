FROM ubuntu:18.04

WORKDIR /ansible

RUN apt-get update -y

RUN apt-get install vim ssh -y

RUN apt-get install ansible -y

RUN echo 'root:root' | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config

RUN sed -i 's/#PubkeyAuthentication/PubkeyAuthentication/' /etc/ssh/sshd_config

RUN sed -i 's/#PasswordAuthentication/PasswordAuthentication/' /etc/ssh/sshd_config