file='read_files.txt'
while read line; do
if [ $line == "1" ]
then
echo $line
fi
done<$file 
