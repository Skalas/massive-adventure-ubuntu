#!/bin/sh
cd $1
red='\033[0;33m'
NC='\033[0m' # No Color
for i in `ls`
do
    cd $i
    echo "================================"
    echo "== Directory: ${red}$i${NC}"
    echo "================================"
    git status
    cd ..
done
