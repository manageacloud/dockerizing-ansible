FROM phusion/baseimage
MAINTAINER Ruben Rubio Rey  "ruben.rubio@manageacloud.com"


# install and configure ansible
RUN apt-get install software-properties-common
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update
RUN apt-get install ansible python-apt -y


# install git
RUN apt-get install git -y

# clone ansible playbook 
RUN cd /usr/local/src/ && git clone https://github.com/darthwade/ansible-wordpress.git

# install roles in ansible playbook
RUN ansible-galaxy install -r /usr/local/src/ansible-wordpress/ansible/requirements.txt --force
COPY files/ansible-hosts /etc/ansible/hosts

# Run the container in "privileged" mode to enable CAP_SYS_ADMIN capability i
# and execute networking stuff (like firewall)
# or remove in playbook sections related with networking
COPY files/ansible-no-privilege.yml /usr/local/src/ansible-wordpress/ansible/roles/common/meta/main.yml

# RUN Ansible
RUN cd /usr/local/src/ansible-wordpress/ansible/ && ansible-playbook site.yml -c local

# Enable SSH
RUN rm -f /etc/service/sshd/down

# Change root password
RUN echo "root:mypassword" | chpasswd

# Enable services
COPY files/init /etc/my_init.d/10_init_services
RUN chmod +x /etc/my_init.d/10_init_services


