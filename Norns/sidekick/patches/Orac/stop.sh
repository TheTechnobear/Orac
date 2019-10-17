#/bin/bash
echo stopping orac
sudo systemctl stop mec.service
sudo systemctl stop orac.service
sleep 1

