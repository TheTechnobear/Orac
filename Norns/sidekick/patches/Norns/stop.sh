#/bin/bash
echo stopping norns
mv ~/dust/data/system.state /tmp/ ; sed 's/norns.state.clean_shutdown = false/norns.state.clean_shutdown = true/' < /tmp/system.state > ~/dust/data/system.state
sudo systemctl stop norns-maiden.service
sudo systemctl stop norns-matron.service
sudo systemctl stop norns-sclang.service
sudo systemctl stop norns-crone.service
sudo systemctl stop norns-jack.service

