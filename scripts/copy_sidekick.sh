#/bin/bash
ARG=`echo $1 | tr -d '/' `
sidekick_DIR=$ARG/sidekick

if [ "$ARG" != "Norns" ] 
then
	exit -1
fi

echo cp -rf '../NuiLite/resources/sidekick/*' ${sidekick_DIR}
echo cp '../NuiLite/build/release/bin/*' ${sidekick_DIR}
echo cp '../NuiLite/build/release/lib/*' ${sidekick_DIR}
cp -rf ../NuiLite/resources/sidekick/* ${sidekick_DIR}
cp ../NuiLite/build/release/bin/* ${sidekick_DIR}
cp ../NuiLite/build/release/lib/* ${sidekick_DIR}

