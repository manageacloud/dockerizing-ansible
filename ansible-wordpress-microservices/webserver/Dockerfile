FROM ubuntu
MAINTAINER Ruben Rubio Rey  "ruben.rubio@manageacloud.com"

RUN apt-get update

# install and configure ansible
RUN apt-get install software-properties-common -y
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

# Apply Patch to link with Container
COPY files/90-env.ini /etc/php5/apache2/conf.d/90-env.ini
COPY files/wordpress-db.patch /var/sites/awesome_wordpress_site/wordpress-db.patch
RUN cd /var/sites/awesome_wordpress_site && patch wp-config.php < wordpress-db.patch
