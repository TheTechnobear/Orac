#/bin/sh
rm -rf pkg/bela.old
mv pkg/bela pkg/bela.old
mkdir -p pkg/bela
cd pkg/bela
cp -R ../../Core/* .
cp -R ../../Bela/* .

if [ "$NOPACK" ] ; 
then
    echo dev mode - do not package
    exit 0
fi

#now create debian packages
mkdir mec_deb 
cd mec_deb 
mkdir DEBIAN
cp -R ../packaging/mec_pkg/* DEBIAN
mkdir -p etc/systemd/system
cp ../MEC/mec.service etc/systemd/system
mkdir -p etc/udev/rules.d/
cp ../packaging/*.rules etc/udev/rules.d/
mkdir -p usr/local/
cp -R ../MEC usr/local/
cd ..

fakeroot dpkg --build mec_deb
mv mec_deb.deb mec.deb
rm -rf mec_deb


#bela we dont run as orac as systemd service
mkdir orac_deb 
cd orac_deb 
mkdir DEBIAN
cp -R ../packaging/orac_pkg/* DEBIAN
#mkdir -p etc/systemd/system
#cp ../orac/orac.service etc/systemd/system
mkdir -p usr/local/
cp -R ../orac usr/local/

cd ..
fakeroot dpkg --build orac_deb
mv orac_deb.deb orac.deb
rm -rf orac_deb



