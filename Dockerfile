FROM fedora:28

# Metadata
LABEL mantainer="Gius. Camerlingor prototype formerli@gmail.com>"
LABEL version="1.0"
LABEL description="Docker prototype for roger skyline (part I)."

# Docker image name
ENV NAME=roger

# Timezone
ENV TZ="Europe/Paris"

# System update && install packages
RUN dnf update -y
RUN dnf install -y ansible \
	ufw \
	nginx \
	npm \
	git \
	sudo \
	cronie \
	zsh \
	bzip2 \
	iputils \
	util-linux-user

# Ssh
COPY config/sshd_config /etc/ssh/sshd_config

# Cron

# User
RUN echo "roger ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN useradd -ms /bin/zsh roger
USER roger
ENV HOME=/home/roger
WORKDIR $HOME

# Ufw
RUN sudo ufw enable
#RUN sudo ufw allow 2222/tcp
#RUN sudo ufw status

# Shell
RUN sudo chsh -s /usr/bin/zsh roger

# Oh my zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Healthcheck
COPY config/healthcheck /usr/local/bin/
RUN sudo chmod 744 /usr/local/bin/healthcheck

# Web
RUN git clone https://github.com/insin/react-hn.git $HOME/web
WORKDIR $HOME/web
RUN npm install

# Host
USER root
RUN echo "172.17.0.2	skyline.local" >> /etc/hosts
USER roger

# Ports
EXPOSE 5000

# Tls

# Nginx

# Ansible
