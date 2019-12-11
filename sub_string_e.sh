Str="Learn Bash Commands from bash"
#subStr=${Str:0:20}

subStr=$(echo $Str| cut -d \ -f 1-5)
echo 123
echo $subStr
