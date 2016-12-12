#read -p "Enter Start Date yyyy-mm-dd" DATE1
#read -p "Enter End Date yyyy-mm-dd" DATE2

DATE2=2016-03-13
DATE1=2015-04-01

STDATE=$(date +%Y-%m-%d -d "$DATE1")
EDDATE=$(date +%Y-%m-%d -d "$DATE2")

ed=`echo $(($(($(date -d "$DATE2" "+%s") - $(date -d "$DATE1" "+%s"))) / 86400))`
echo "Days" $ed
em=$((ed / 30 ))
echo "Months" $em
eh=$((ed * 24 ))
echo "Hours" $eh
h=`echo "select count(*) from funnel_hourly where merchant ='-1' and source_ =false and mode_ =false and issuer_=false and acs_ = false and gateway_=false and time >= '$STDATE 00:00:00' and time < '$EDDATE 00:00:00' order by time ;" | /usr/local/apache-cassandra-3.3/bin/cqlsh -u merchant_panel -p analytics2016 -k analytics | awk 'NR==4{print $1}'`

echo "No of hourly data points" $h


d=`echo "select  count(*) from funnel_daily where merchant ='-1' and source_ =false and mode_ =false and issuer_=false and acs_ = false and gateway_=false and time >= '$STDATE 00:00:00' and time < '$EDDATE 00:00:00' order by time ;" | /usr/local/apache-cassandra-3.3/bin/cqlsh -u merchant_panel -p analytics2016 -k analytics | awk 'NR==4{print $1}'`


echo "No of Daily data points" $d

 m=`echo "select  count(*) from funnel_monthly where merchant ='-1' and source_ =false and mode_ =false and issuer_=false and acs_ = false and gateway_=false and time >= '$STDATE 00:00:00' and time < '$EDDATE 00:00:00' order by time ;" | /usr/local/apache-cassandra-3.3/bin/cqlsh -u merchant_panel -p analytics2016 -k analytics | awk 'NR==4{print $1}'`

echo "No of Monthly data points" $m


if [ $m != $em  ] 
then

SDATE=$(date +%Y-%m-%d -d "2015-04-01")
EDATE=$(date +%Y-%m-%d -d "2015-04-30")
echo "Following date does not have Monthly Data points"
for i in `eval echo {1..$em}`

do


out=`echo "select count(*) from funnel_monthly where merchant ='-1' and source_ =false and mode_ =false and issuer_=false and acs_ = false and gateway_=false and time >= '$SDATE 00:00:00' and time < '$EDATE 00:00:00' order by time ;" | /usr/local/apache-cassandra-3.3/bin/cqlsh -u merchant_panel -p analytics2016 -k analytics | awk 'NR==4{print $1}'`

SDATE=$(date +%Y-%m-%d -d "$SDATE + 1 month")
EDATE=$(date +%Y-%m-%d -d "$EDATE + 1 month")


if [ $out != 1 ]
then
echo $SDATE 
fi


done
 

fi






if [ $h != $eh  ]
then
SDATE=$(date +%Y-%m-%d -d "2015-04-01")
EDATE=$(date +%Y-%m-%d -d "2015-04-01")
j=0
k=0
echo "Following date does not have Hourly Data points"
for i in `eval echo {1..$eh}`

do
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

fi


if [ $d != $ed ]
  then
  SDATE=$(date +%Y-%m-%d -d "2015-04-01")
  EDATE=$(date +%Y-%m-%d -d "2015-04-02")
  echo "Following date does not have Daily Data points"
 
  for i in `eval echo {1..$ed}`
 
  do
  out=`echo "select count(*) from funnel_daily where merchant ='-1' and source_ =false and mode_ =false and issuer_=false and acs_ = false and gateway_=false and time     >= '$SDATE 00:00:00' and time < '$EDATE 00:00:00' order by time ;" | /usr/local/apache-cassandra-3.3/bin/cqlsh -u merchant_panel -p analytics2016 -k analytics | awk 'NR==4{print $1}'`
 
  SDATE=$(date +%Y-%m-%d -d "$SDATE + 1 day")
  EDATE=$(date +%Y-%m-%d -d "$EDATE + 1 day")
 
 
  if [ $out != 1 ]
  then
  echo   $SDATE
  fi
 
 
  done
 
 
  fi

