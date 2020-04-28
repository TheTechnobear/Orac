#/bin/bash
echo starting orac
sudo systemctl start orac.service
# let user release b1
sleep 1
sudo systemctl start mec.service

