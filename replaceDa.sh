#!/bin/bash
#copy bee-1 key


docker-compose down
sleep 60
# cp -r /var/lib/docker/volumes/beequeen_bee-1/_data /home/data/bee &&  cp -r /var/lib/docker/volumes/beequeen_clef-1/_data /home/data/clef
# tar -zcf - /home/data |openssl des3 -salt -k 123456789110 | dd of=data.des3

rm -r /var/lib/docker/volumes/beequeen_bee-1/_data && rm -r /var/lib/docker/volumes/beequeen_clef-1/_data
dd if=data.des3 |openssl des3 -d -k 123456789110 | tar zxf -
cp -r /root/beequeen/home/data/clef/_data /var/lib/docker/volumes/beequeen_clef-1
chmod -R 777 /var/lib/docker/volumes/beequeen_clef-1/_data
cp -r /root/beequeen/home/data/bee/_data /var/lib/docker/volumes/beequeen_bee-1
chmod -R 777 /var/lib/docker/volumes/beequeen_bee-1/_data
cd /root/beequeen
docker-compose up -d

