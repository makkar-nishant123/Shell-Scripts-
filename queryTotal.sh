db.funnel_daily.find({"_id.time":{"$gte":ISODate("2016-03-09T18:30:00.000Z"),"$lte":ISODate("2016-03-10T18:29:59.000Z")},"_id.gateway_":false,"_id.acs_":false,"_id.issuer_":false,"_id.mode_":true,"_id.source_":true,"_id.merchant":"3", "value.incident_count" : {"$gt" : 0 } , "_id.mode" : {$in: [ "CC", "DC" , "NB" ]} } , {"_id"  : 0 , "value.incident_count" :  1 }).pretty()

