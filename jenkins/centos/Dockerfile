FROM centos

RUN yum -y install openssh-server

RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

# Copy public key to container
COPY ./remote-key.pub /home/remote_user/.ssh/authorized_keys

# Harden .ssh key
RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

RUN ssh-keygen -A

RUN rm -rf /run/nologin

RUN yum -y install mysql python3
RUN pip3 install awscli --upgrade

CMD [ "/usr/sbin/sshd", "-D" ]
