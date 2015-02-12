webserver_container:
	sudo docker build -t ansible-ms-webserver .

run_webserver_container_bash:
	sudo docker run -i -t ansible-ms-webserver /bin/bash

run_webserver_container_apache:
	sudo docker run --name web -d -p 1800:80 --link db:db ansible-ms-webserver /usr/sbin/apache2ctl -D FOREGROUND

run_env:
	sudo docker run --name web -p 1800:80 --link db:db ansible-ms-webserver env
