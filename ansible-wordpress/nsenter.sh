#!/bin/bash
PID=$(sudo docker inspect --format {{.State.Pid}} ansible-wordpress-run )
sudo /tmp/nsenter --target $PID --mount --uts --ipc --net --pid
