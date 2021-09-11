#/bin/bash
echo starting orac
sudo systemctl start orac.service
# let user release b1
sleep 2
sudo systemctl start mec.service

