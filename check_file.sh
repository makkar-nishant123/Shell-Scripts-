#!/bin/bash
echo -n "Enter directory name ->"
read dir
if [ -f "$dir" ]
then
echo "Directory exists"
else
`touch $dir`
echo "Directory created"
fi


