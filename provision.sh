#!/usr/bin/env bash
apt update
apt upgrade -y

# Nginx
apt install -y nginx
cp /vagrant/nginx_default /etc/nginx/sites-enabled/default
service nginx restart

# React (node, npm)
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt install -y nodejs

# CSTR-Client
cp /vagrant/env /vagrant/cstr-client/.env
chown vagrant:vagrant /vagrant/cstr-client/.env

# Python 3.7
apt install -y gcc make libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev libgdbm-dev libc6-dev libbz2-dev zlib1g-dev openssl libffi-dev

mkdir /tmp/Python37
cd /tmp/Python37
wget -q --show-progress https://www.python.org/ftp/python/3.7.1/Python-3.7.1rc1.tar.xz
tar xvf Python-3.7.1rc1.tar.xz
cd /tmp/Python37/Python-3.7.1rc1
./configure
make clean
make
make altinstall

# CSTR-Server
python3.7 -m venv --copies /vagrant/cstr-server/venv
chown -R vagrant:vagrant /vagrant/cstr-server/venv

# Environment Vars
cd /vagrant/
cat environment_varibles >> /home/vagrant/.bashrc
chown -R vagrant:vagrant /home/vagrant/.bashrc
