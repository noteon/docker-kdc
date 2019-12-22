env KRB5_KTNAME=/home/ubuntu/docker-kdc/krb5.keytab \
/usr/bin/mongod \
--bind_ip_all \
--port 27040 \
 --dbpath=$HOME/data/mongodb