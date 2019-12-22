#重要
#client一定要修改 /etc/hosts, windows:  c:\windows\system32\drivers\etc\hosts
增加: 
18.140.180.185 sg.mongobooster.com
51.15.116.180  lab.mongobooster.com

mongo --host qhmongo-virtualbox --port 27040 \ 
--authenticationMechanism=GSSAPI --authenticationDatabase='$external' \ 
--username mongodb/qhmongo-virtualbox@MONGOBOOSTER.COM --password mongodb


# sg.mongobooster.com
mongo --host sg.mongobooster.com --port 27040 \
--authenticationMechanism=GSSAPI --authenticationDatabase='$external' \
--username mongodb/sg.mongobooster.com@SG.MONGOBOOSTER.COM \
--password mongodb



//or mongoshell
use $external
db.auth( { mechanism: "GSSAPI", user: "mongodb/sg.mongobooster.com@SG.MONGOBOOSTER.COM" , password:"mongodb"} )