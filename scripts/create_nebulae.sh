#/bin/sh
#note: cannot be run as root, use another user .. 
# e.g 
# mkdir pkg;chmod 777 pkg
# su alarm -c ./scripts/create_nebulae.sh 

rm -rf pkg/nebulae.old
mv pkg/nebulae pkg/nebulae.old
mkdir -p pkg/nebulae
mkdir -p pkg/nebulae/pd

cd pkg/nebulae
cp -R ../../Core/* .
cp -R ../../PI/* .
cp -R ../../Nebulae/* .

cp orac/pd/orac.pd .
cp MEC/mec.instr
cp resources/* .

mkdir mec_arch 
cd mec_arch 
cp ../packaging/mec_arch/PKGBUILD .
cp ../packaging/mec_arch/mec.install .

mkdir pkgs
mkdir mec
cd mec
mkdir -p etc/systemd/system
cp ../../MEC/mec.service etc/systemd/system
mkdir -p etc/udev/rules.d/
cp ../../packaging/*.rules etc/udev/rules.d/
mkdir -p usr/local/
cp -R ../../MEC usr/local/
cd ..
zip -r mec.zip mec
makepkg -g >> PKGBUILD
makepkg 
cp *.xz ../pkgs
cd ..


mkdir orac_arch 
cd orac_arch

cp ../packaging/orac_arch/PKGBUILD .
cp ../packaging/orac_arch/orac.install .

mkdir orac 
cd orac
mkdir -p usr/local/
cp -R ../../orac usr/local/
cd ..

zip -r orac.zip orac
makepkg -g >> PKGBUILD
makepkg
cp *.xz ../pkgs
cd ..

#cleanup
rm -rf mec_arch
rm -rf orac_arch
rm -rf packaging
rm -rf MEC orac


