#/bin/bash
echo starting norns
sudo systemctl start norns-jack.service
sudo systemctl start norns-crone.service
sudo systemctl start norns-sclang.service
sudo systemctl start norns-matron.service

