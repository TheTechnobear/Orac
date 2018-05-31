#/bin/bash
cd `dirname $0`
DIR=`pwd`

# copy for release, link for development
#rm -rf ~/MEC ~/Bela/projects/orac
#cp -R MEC ~/
#cp -R orac ~/Bela/projects

rm ~/MEC ~/Bela/projects/orac
ln -s $DIR/MEC ~/
ln -s $DIR/orac ~/Bela/projects

cp MEC/mec.service /lib/systemd/system/
echo stopping mec, will restart in 7 seconds
systemctl enable mec
systemctl stop mec
sleep 7
systemctl start mec
systemctl status mec
