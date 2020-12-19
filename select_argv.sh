#!/bin/bash

echo "Give argv exsample, like, 1 2 3 4 5 6 7 8 9"
echo ""

echo "Show all argvs"
echo $*
echo ""

echo "Show \$0"
echo $0
echo ""

echo "Show \$*"
echo $*
echo ""

echo "Show \$@"
echo $@
echo ""

echo "Show \${@:3}, 3rd argvs onward"
echo ${@:3}
echo ""

echo "Show \${@:3:5}, 3rd through 5th"
echo ${@:3:5}
echo ""
