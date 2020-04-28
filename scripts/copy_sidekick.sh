#/bin/bash
ARG=`echo $1 | tr -d '/' `
sidekick_DIR=$ARG/sidekick

if [ "$ARG" == "Norns" ] 
then
    mkdir -p ${sidekick_DIR}
    mkdir -p ${sidekick_DIR}/patches
    mkdir -p ${sidekick_DIR}/pdexternals
    mkdir -p ${sidekick_DIR}/nuisdk
    cp -rf ../NuiLite/resources/sidekick/* ${sidekick_DIR}
    cp ../NuiLite/build/release/bin/sidekick ${sidekick_DIR}
    cp ../NuiLite/build/release/lib/*so ${sidekick_DIR}
    cp ../NuiLite/build/release/lib/* ${sidekick_DIR}/nuisdk
    cp ../NuiLite/nuilite/NuiDevice.h ${sidekick_DIR}/nuisdk
    cp -rf ../NuiLite/demos/ ${sidekick_DIR}/patches
    cp ../NuiLite/build/release/lib/* ${sidekick_DIR}/pdexternals
fi

if [ "$ARG" == "TT" ] 
then
    mkdir -p ${sidekick_DIR}
    mkdir -p ${sidekick_DIR}/patches
    mkdir -p ${sidekick_DIR}/pdexternals
    mkdir -p ${sidekick_DIR}/ttuisdk
    cp -rf ../TTuiLite/resources/sidekick/* ${sidekick_DIR}
    cp ../TTuiLite/build/release/bin/sidekick ${sidekick_DIR}
    cp ../TTuiLite/build/release/lib/*so ${sidekick_DIR}
    cp ../TTuiLite/build/release/lib/* ${sidekick_DIR}/ttuisdk
    cp ../TTuiLite/ttuilite/TTuiDevice.h ${sidekick_DIR}/ttuisdk
    cp -rf ../TTuiLite/demos/ ${sidekick_DIR}/patches
    cp ../TTuiLite/build/release/lib/* ${sidekick_DIR}/pdexternals
if

