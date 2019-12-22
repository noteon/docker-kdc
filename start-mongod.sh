sudo apt-get install  libsasl2-modules libsasl2-modules-gssapi-mit

env KRB5_KTNAME=/home/ubuntu/docker-kdc/krb5.keytab \
KRB5_TRACE=/logs/mongodb-kerberos.log \
/usr/bin/mongod \
--port 27040 \
--bind_ip_all \
--dbpath=$HOME/data/mongodb  \
--auth \
--setParameter authenticationMechanisms=GSSAPI \
--wiredTigerCacheSizeGB 0.3 \
--logpath=$HOME/data/mongodb/mongod.log \
--fork \



