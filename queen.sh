#!/bin/bash
#copy bee-1 key

apt-get update
sleep 60
apt  install jq -y
sleep 30

echo "install docker"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 
apt-get update
sleep 60
apt-get install docker-ce docker-ce-cli containerd.io -y
sleep 60

echo "docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose	

docker-compose up -d
sleep 30
docker-compose down
sleep 20

rm -r /var/lib/docker/volumes/docker_bee-1/_data
rm -r /var/lib/docker/volumes/docker_clef-1/_data
dd if=data.des3 |openssl des3 -d -k * | tar zxf -
cp -r /root/beequeen/home/data/clef/_data /var/lib/docker/volumes/beequeen_clef-1
chmod -R 777 /var/lib/docker/volumes/beequeen_clef-1/_data
cp -r /root/beequeen/home/data/bee/_data /var/lib/docker/volumes/beequeen_bee-1
chmod -R 777 /var/lib/docker/volumes/beequeen_bee-1/_data
cd /root/beequeen
docker-compose up -d

