read -p "Give filename with path " file

read -p "Give table type" ttype

sed "s/|/,/g" $file > dump.csv



#Before Comma
sed "s/,/',/7" dump.csv > temp.csv
sed "s/,/',/9"  temp.csv > dump.csv
sed "s/,/',/10" dump.csv > temp.csv
sed "s/,/',/11"  temp.csv > dump.csv
sed "s/,/',/12" dump.csv > temp.csv
sed "s/,/',/13"  temp.csv > dump.csv
sed "s/,/',/8" dump.csv > temp.csv
sed "s/,/',/20"  temp.csv > dump.csv
sed "s/,/',/27"  dump.csv > temp.csv 
#After COmma
sed "s/,/,'/26"  temp.csv > dump.csv
sed "s/,/,'/8" dump.csv > temp.csv
sed "s/,/,'/9"  temp.csv > dump.csv
sed "s/,/,'/10" dump.csv > temp.csv
sed "s/,/,'/11"  temp.csv > dump.csv
sed "s/,/,'/12" dump.csv > temp.csv
sed "s/,/,'/7"  temp.csv > dump.csv
sed "s/,/,'/6"  dump.csv > temp.csv
sed "s/,/,'/19"  temp.csv > dump.csv
q="insert into funnel_$ttype( merchant , source_ , mode_ , issuer_ , acs_  , gateway_ , time                     ,source , mode   , issuer , acs , gateway , acs_category , auto_refunded_amount , auto_refunded_count , bounced_amount , bounced_count , cancelled_amount , cancelled_count , created_on               , dropped_amount , dropped_count , failed_amount , failed_count , incident_amount , incident_count , parent_time              , refunded_amount , refunded_count , successful_amount , successful_count) values ("


sed "s/,/',/1"  dump.csv > temp.csv 
cat temp.csv | tr -d " \t"  | sed 's/[-0-9][-0-9]:[-0-9]/ &/g' | sed "s/^/$q'/g" | sed 's/$/ );/'  > final.csv
rm dump.csv
rm temp.csv
