env KRB5_KTNAME=/home/qinghai/MyWorkspace/docker-kdc/krb5.keytab \
/usr/bin/mongod \
--port 27040 \
--smallfiles \
--dbpath=/data/mongodb \
 --auth \
--setParameter authenticationMechanisms=GSSAPI \
