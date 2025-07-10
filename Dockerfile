FROM ubuntu:20.04

RUN apt-get update && apt-get install -y openssh-server
RUN echo 'root:123456' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN echo 'if [ ! -f /flag.txt ]; then echo "flag={{123456}}" > /flag.txt; fi' >> /root/.bashrc

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]