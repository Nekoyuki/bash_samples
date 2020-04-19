#!/bin/bash
 
COMMAND=$1      # The command that will be executed if "yes"
 
echo "You will ${COMMAND} to << `hostname` >>, Are you sure? (yes or no)"
read ANS1
 
if [ "${ANS1}" = 'y' -o "${ANS1}" = 'yes' ]; then
    echo 'Really? (yes or no)'
    read ANS2
    if [ "${ANS2}" = 'y' -o "${ANS2}" = 'yes' ]; then
        echo "${COMMAND} `hostname`."
        exec ${COMMAND}
    fi
fi
echo "${COMMAND} cancelled."
