
container:
	sudo docker build -t ansible-wordpress .

run_container:
	sudo docker run --name ansible-wordpress-run -p 2200:22 -p 1800:80 ansible-wordpress /sbin/my_init --enable-insecure-key

ps: 
	sudo docker ps

clean-ssh-keygen:
	ssh-keygen -f "/home/tk421/.ssh/known_hosts" -R [localhost]:2200

ssh: clean-ssh-keygen
	ssh root@localhost -o "StrictHostKeyChecking no" -p 2200

ssh-key: clean-ssh-keygen
	ssh root@localhost -p 2200 -o "StrictHostKeyChecking no" -i insecure-ssh-key

clean_ssh:
	ssh-keygen -f "/home/tk421/.ssh/known_hosts" -R [localhost]:2200

create_nsenter:
	sudo docker run --rm jpetazzo/nsenter cat /nsenter > /tmp/nsenter && chmod +x /tmp/nsenter

nsenter: 
	bash nsenter.sh

remove_all_containers:
	bash remove_all_containers.sh

#remove_all_images:
#	bash remove_all_images.sh

remove_container_ansible-wordpress-run:
	sudo docker rm ansible-wordpress-run

remove_image_ansible-wordpress:
	sudo docker rmi ansible-wordpress

run_registry:
	sudo docker run -d -e SETTINGS_FLAVOR=local -e STORAGE_PATH=/var/lib/docker_registry  -p 5000:5000 registry

push_registry:
	sudo docker tag ansible-wordpress localhost:5000/wordpress-ansible
	sudo docker push  localhost:5000/wordpress-ansible

pull_registry:
	sudo docker pull localhost:5000/wordpress-ansible

run_container_registry:
	sudo docker run --name ansible-wordpress-run -p 2200:22 -p 1800:80  localhost:5000/wordpress-ansible /sbin/my_init --enable-insecure-key

