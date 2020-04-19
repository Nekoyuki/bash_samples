#!/bin/bash

# Remove suffix
echo ">>>1"
BASENAME=`basename $0|sed 's/\.[^\.]*$//'`
echo "${BASENAME}"

# Remove suffix
echo ""; echo ">>>2"
BASENAME=`basename ${0%.*}`
echo "${BASENAME}"

# Basename
echo ""; echo ">>>3"
BASENAME=${0##*/}
echo "${BASENAME}"

# Replace letters
echo ""; echo ">>>4"
tbl="
aaa.JPG
bbb.JPG
ccc.JPG
"

echo $tbl
for i in `echo $tbl`
do
    echo $i
    echo ${i//.JPG/.jpg}
done

# Date
echo ""; echo ">>>5"
date "+%Y_%m_%d_%H_%M"


