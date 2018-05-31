#/bin/bash
cd `dirname $0`
DIR=`pwd`

# copy for release, link for development
#rm -rf /usr/local/MEC /usr/local/orac
#cp -R MEC /usr/local
#cp -R orac /usr/local

rm /usr/local/MEC /usr/local/orac
ln -s $DIR/MEC /usr/local
ln -s $DIR/orac /usr/local

#currently need to be able to write to local rack file
chmod a+w /usr/local/orac/*

cp MEC/mec.service /lib/systemd/system/
systemctl enable 
systemctl restart 
systemctl status 

cp orac/orac.service /lib/systemd/system/
systemctl enable 
systemctl restart 
systemctl status 
