#!/bin/bash

tbl="
aaa,1
bbb,2
ccc,3
"

echo ""
echo ">>> show table."
echo "$tbl"

echo ""
echo ">>> split tbl into each element."
for i in `echo $tbl`
do
    echo $i | sed -e 's/,/ /'
    for j in `echo $i | sed -e 's/,/ /'`
    do
        echo $j
    done
done

echo ""
echo ">>> add new element into tbl."
tbl2=`echo -n "$tbl";echo "ddd,4"`

echo ""
echo ">>> show table."
echo "$tbl2"

echo ""
echo ">>> split tbl into each element."
for i in `echo $tbl2`
do
    echo $i | sed -e 's/,/ /'
    for j in `echo $i | sed -e 's/,/ /'`
    do
        echo $j
    done
done
