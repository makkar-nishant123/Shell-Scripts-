SDATE=$(date +%Y-%m-%d -d "2015-04-01")
EDATE=$(date +%Y-%m-%d -d "2015-04-01")

j=0
k=0
echo "Following date does not have Hourly Data points"
for i in `eval echo {1..30}`

do
echo $j
echo $k
echo $SDATE
echo $EDATE
out=`echo "select count(*) from funnel_hourly where merchant ='-1' and source_ =false and mode_ =false and issuer_=false and acs_ = false and gateway_=false and time >= '$SDATE $j:00:00' and time <= '$EDATE $k:59:00' order by time ;" | /usr/local/apache-cassandra-3.3/bin/cqlsh -u merchant_panel -p analytics2016 -k analytics | awk 'NR==4{print $1}'`




if [ $k = 23 ]
then

j=-1
k=-1

SDATE=$(date +%Y-%m-%d -d "$SDATE + 1 day")
EDATE=$(date +%Y-%m-%d -d "$EDATE + 1 day")
fi

if [ $out != 1 ]
then
echo  "dsf" $SDATE "$j"":00:00"
fi

k=$((k+1))
j=$((j+1))


done


