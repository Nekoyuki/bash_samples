#!/bin/bash
# Logger
# Version 01
#**************************************
BASENAME=`echo $1|sed 's/\.[^\.]*$//'`

# Help
#**************************************
function usage() {
cat <<_EOT_
Usage:
  `basename $0` script.sh
  `basename $0` script.sh sample_hage
  `basename $0` -h

Description:
  Logging tool for a script run

Options:
  -h help

_EOT_
  exit 1
}

# Option/Argument
#**************************************
if [ $# -eq 0 ];then
    usage
fi

if [ $1 = "-h" ];then
    usage
fi

if [ $# -eq 1 ];then
    if [ ! -f $1 ];then
        echo "No $1 found"
        exit 1
    fi

    LOG=${BASENAME}_`date "+%Y_%m_%d_%H_%M"`.log
    EDCLOG=${BASENAME}_`date "+%Y_%m_%d_%H_%M"`_edc.log
fi

if [ $# -eq 2 ];then
    LOG=${BASENAME}_`date "+%Y_%m_%d_%H_%M"`_${2}.log
    EDCLOG=${BASENAME}_`date "+%Y_%m_%d_%H_%M"`_${2}_edc.log
fi

# cat script
#**************************************
cat $1 |& tee -a ${LOG}
echo "================================================================" |& tee -a ${LOG}

# Logging and run
#**************************************
$1 |& tee -a ${LOG}
echo "================================================================" |& tee -a ${LOG}

# Close
#**************************************
cp edc.log ${EDCLOG}
