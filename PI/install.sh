#/bin/bash
echo run this as 
echo sudo ./install.sh


cd `dirname $0`
DIR=`pwd`

systemctl stop mec
systemctl stop orac

systemctl stop amidiauto
systemctl disable amidiauto
systemctl stop touchosc2midi
systemctl disable touchosc2midi
#systemctl stop pisound-btn
#systemctl disable pisound-btn
systemctl stop pisound-ctl
systemctl disable pisound-ctl

#copy for release, link for development
if [ -z "$DEV" ] ; 
then
	cp -R --remove-destination MEC /usr/local
	cp -R --remove-destination orac /usr/local
else 
	rm /usr/local/MEC /usr/local/orac
	ln -s $DIR/MEC /usr/local
	ln -s $DIR/orac /usr/local
	cp -R orac /usr/local
fi


cp --remove-destination MEC/mec.service /etc/systemd/system/
cp --remove-destination orac/orac.service /etc/systemd/system/

cd orac
mkdir -p $HOME/media/orac/usermodules
cp -nr media $HOME
cp -nr data $HOME

systemctl daemon-reload


systemctl enable mec
systemctl enable orac

systemctl restart orac
sleep 7
systemctl restart mec

systemctl status orac
systemctl status mec 



