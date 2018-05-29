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
systemctl enable mec.service
systemctl restart mec.service
systemctl status mec.service  
