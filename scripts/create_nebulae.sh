#/bin/sh
rm -rf pkg/nebulae.old
mv pkg/nebulae pkg/nebulae.old
mkdir -p pkg/nebulae
mkdir -p pkg/nebulae/pd

cd pkg/nebulae
cp -R ../../Core/* .
cp -R ../../Bela/* .

mkdir mec_arch 
cd mec_arch 
cp ../packaging/mec_arch/PKGBUILD
cp ../packaging/mec_arch/mec.install

mkdir -p etc/systemd/system
cp ../MEC/mec.service etc/systemd/system
mkdir -p etc/udev/rules.d/
cp ../packaging/*.rules etc/udev/rules.d/
mkdir -p usr/local/
cp -R ../MEC usr/local/
makepkg
cd ..


mkdir orac_arch 
cd orac_arch 
cp ../packaging/orac_arch/PKGBUILD
cp ../packaging/orac_arch/orac.install
#mkdir -p etc/systemd/system
#cp ../orac/orac.service etc/systemd/system
mkdir -p usr/local/
cp -R ../orac usr/local/
makepkg
cd ..