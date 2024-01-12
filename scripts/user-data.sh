#!/bin/bash
#
# Author: InferenceFailed Developers
# Created on: 27/12/2023
cloud-init status --wait

export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get upgrade -y
apt-get install wireguard python3 python3-pip python3-virtualenv -y

echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
sysctl -p

git clone https://$GITHUB_PAT@github.com/InferenceFailed/wireguard-server.git /server/
cd /server/

virtualenv -q ./venv/ && source ./venv/bin/activate
pip3 install -r ./requirements.txt
python3 ./manage.py makemigrations api
python3 ./manage.py migrate
DJANGO_SUPERUSER_PASSWORD=WireGuard@443 python3 ./manage.py createsuperuser --noinput --username=admin --email admin@harsha.engineer

# Cleanup
cloud-init clean --logs --machine-id
apt-get autoremove -y --purge
apt-get clean && apt-get autoclean

unset GITHUB_PAT
cloud-init clean --logs --machine-id --seed

rm -r -f /tmp/*
find /var/log -type f -exec truncate -s 0 {} \;
history -c
