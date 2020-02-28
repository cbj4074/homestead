#!/bin/sh

echo 'Installing Laravel Echo...'

# Copy Homestead-generated self-signed certificates into location that does
# not require root access, given that the limited-privilege "vagrant" user
# starts the Echo server.

mkdir /home/vagrant/ssl
cp /etc/nginx/ssl/unit3d.site.crt /home/vagrant/ssl/
cp /etc/nginx/ssl/unit3d.site.key /home/vagrant/ssl/
chown -R vagrant:vagrant /home/vagrant/ssl/
chmod 770 /home/vagrant/ssl
chmod 600 /home/vagrant/ssl/*

sudo npm install -g laravel-echo-server

cp -f /vagrant/scripts-custom/configs/laravel-echo-server.json "$1/"
