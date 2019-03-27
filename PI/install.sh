#/bin/bash
echo run this as 
echo sudo ./install.sh


cd `dirname $0`
DIR=`pwd`

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

systemctl restart mec
systemctl restart orac

systemctl status mec 
systemctl status orac



