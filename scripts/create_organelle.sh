#/bin/sh
rm -rf pkg/organelle.old
mv pkg/organelle pkg/organelle.old
mkdir -p pkg/organelle
cd pkg/organelle
cp -R ../../Core/* .
cp -R ../../Organelle/* .

if [ "$NOPACK" ] ; 
then
    echo dev mode - do not package
    exit 0
fi


~/scripts/create_install_package.sh orac
~/scripts/create_install_package.sh MEC

