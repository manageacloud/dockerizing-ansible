#!/bin/bash
sudo docker rmi $(sudo docker images -q)
