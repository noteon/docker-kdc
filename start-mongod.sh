env KRB5_KTNAME=/home/qinghai/MyWorkSpace/docker-kdc/krb5.keytab \
/usr/bin/mongod \
--port 27040 \
--smallfiles \
--dbpath=$HOME/data/mongodb \
 --auth \
--setParameter authenticationMechanisms=GSSAPI \
