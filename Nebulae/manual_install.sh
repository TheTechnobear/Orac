# this is an example fot he steps required 
# it advised you use the pacman package

export HOME=/home/alarm
cp -R pd $HOME

cp pd/orac.json /
mkdir -p $HOME/media/orac/usermodules
cp -nr pd/orac/media $HOME
cp -nr pd/orac/data $HOME

cp -R MEC $HOME
cp MEC/mec.service /etc/systemd/system/
cp MEC/mec.instr $HOME/instr

systemctl daemon-reload
systemctl status mec 


