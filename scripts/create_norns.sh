#/bin/sh
mkdir -p pkg/norns
rm -rf pkg/norns.old
mv pkg/norns pkg/norns.old
mkdir -p pkg/norns
cd pkg/norns
cp -R ../../Core/* .
cp -R ../../PI/* .
cp -R ../../Norns/* .

cp ../../Norns/.pdsettings ./orac
rm ./manual_install.sh

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


mkdir orac_deb 
cd orac_deb 
mkdir DEBIAN
cp -R ../packaging/orac_pkg/* DEBIAN
mkdir -p etc/systemd/system
cp ../orac/orac.service etc/systemd/system
mkdir -p usr/local/
cp -R ../orac usr/local/
cd ..
fakeroot dpkg --build orac_deb
mv orac_deb.deb orac.deb
rm -rf orac_deb


mkdir sidekick_deb 
cd sidekick_deb 
mkdir DEBIAN
cp -R ../packaging/sidekick_pkg/* DEBIAN
mkdir -p etc/systemd/system
cp ../sidekick/sidekick.service etc/systemd/system
cp ../sidekick/sidekick-init.service etc/systemd/system
cp ../sidekick/sidekick.target etc/systemd/system
mkdir -p usr/local/
cp -R ../sidekick usr/local/

cd ..
fakeroot dpkg --build sidekick_deb
mv sidekick_deb.deb sidekick.deb
rm -rf sidekick_deb

