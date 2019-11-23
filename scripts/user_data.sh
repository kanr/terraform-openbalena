#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

apt-get install -y software-properties-common
apt-get update
apt-get install -y letsencrypt certbot zip build-essential docker.io libssl-dev node-gyp nodejs npm 

adduser --disabled-password --gecos "" balena && usermod -aG docker balena

curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "\n----- Installing Openbalena ------\n"
# curl -L https://github.com/balena-io/open-balena/archive/master.zip -o balena.zip \
# && unzip balena.zip
git clone https://github.com/balena-io/open-balena.git ~/open-balena

# cd open-balena 

./scripts/quickstart -U kanr@protonmail.com -P openbalena -d portbyte.com
./scripts/compose config > docker-compose.yml
docker-compose up -d

# npm install balena-cli -g --production --unsafe-perm