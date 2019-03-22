export PD=${PD:="/Applications/Pd-0.48-1.app/Contents/Resources/bin/pd"}
cd `dirname $0`
DIR=`pwd -P`
export PD_OPTS=${PD_OPTS:="-nogui"}

export MEC_OPTS=${MEC_OPTS:="osckontrol.json"}
#PD-OPTS='-nogui -rt - audiobuf 4'
killall pd
cd ${DIR}/orac
echo ${PD} ${PD_OPTS} mother.pd main.pd
${PD} ${PD_OPTS} mother.pd main.pd >/tmp/orac.log 2>&1 &
cd ${DIR}/MEC
killall mec-app
echo ./mec-app ${MEC_OPTS}
./mec-app ${MEC_OPTS}  >/tmp/mec.log 2>&1 &
ps auxwwww | grep mother.pd
ps auxwwww | grep ${MEC_OPTS}

