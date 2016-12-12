HOME=/home/nishant.makkar
QUERY=/home/nishant.makkar/queries

echo "Total"

$HOME/mongo.sh < $QUERY/queryTotal.sh | awk   {'print $7'} | awk '{s+=$1} END {print s}'

echo "Desktop"

$HOME/mongo.sh < $QUERY/queryzero.sh | awk   {'print $7'} | awk '{s+=$1} END {print s}'




echo "Mobile"
$HOME/mongo.sh < $QUERY/queryone.sh | awk   {'print $7'} | awk '{s+=$1} END {print s}'


echo "Others"

$HOME/mongo.sh < $QUERY/queryneg1.sh | awk   {'print $7'} | awk '{s+=$1} END {print s}'


echo "CC"

$HOME/mongo.sh < $QUERY/queryCC.sh | awk   {'print $7'} | awk '{s+=$1} END {print s}'

echo "DC"
$HOME/mongo.sh < $QUERY/queryDC.sh | awk   {'print $7'} | awk '{s+=$1} END {print s}'


echo "NB"

$HOME/mongo.sh < $QUERY/queryNB.sh | awk   {'print $7'} | awk '{s+=$1} END {print s}'


