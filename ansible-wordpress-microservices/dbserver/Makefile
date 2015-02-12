dbserver_container:
	sudo docker build -t ansible-ms-dbserver .

run_dbserver_container_bash:
	sudo docker run -i -t ansible-ms-dbserver /bin/bash

run_dbserver_container_mysql:
	sudo docker run --name db -d ansible-ms-dbserver /usr/sbin/mysqld
