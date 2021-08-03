#!/bin/bash

sudo apt-get update -y
sudo apt-get install apache2 -y
sudo ufw allow 'Apache Full'
sudo ufw enable -y