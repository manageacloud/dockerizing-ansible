# Dockerizing Ansible Playbooks

This is the generic process of creating Docker containers from existing Ansible Playbooks. This example creates a Wordpress application from a random wordpress ansible playbook found on Internet.

## Multi-process approach

If you want to create Docker containers and use them in a similar way than the traditional virtual environments. In order to do that we are taking [Ubuntu Base image](https://phusion.github.io/baseimage-docker/) that is friendly with Docker containers.

Everything related with the multi-process approach is under `ansible-wordpress` directory. Look at the file `Makefile` to see the actual commands.

### Image creation

    make container

### Run container from image

    make run_container

Now you can access to the wordpress application at port http://localhost:1800 and ssh at port 2200
  
### Access via ssh (auto authentication)

    make ssh-key
    
### Run Docker Registry

    make run_registry

### Push Docker Registry

    make push_registry

### Pull Docker Registry

    make pull_registry

### Run Container from Registry

    make run_container_registry

## Microservices approach

Create two containers, one with MySQL (called "db") and the other one with Apache2 (called "web"). Apache2 will connect to MySQL in the container db.

Once both containers are up and running, you can access to wordpress at http://localhost:1800

If you need to access to the bash into the containers, you can use `nsenter` (look for an example at `ansible-wordpress/Makefile`), as ssh daemon is not working in the microservices. 

### Container db (MySQL)

Directory `ansible-wordpress-microservices/dbserver/`

#### Create db image from Dockerfile

    make dbserver_container

#### Run db container

    make run_dbserver_container_mysql

### Container web (Apache2)

Directory `ansible-wordpress-microservices/webserver`

#### Create web image from Dockerfile

    make webserver_container

#### Run web container

    make run_webserver_container_apache

