env KRB5_KTNAME=/home/ubuntu/git-projects/docker-kdc/krb5.keytab \
/usr/bin/mongod \
--port 27040 \
--smallfiles \
--dbpath=/mnt/mongodb/mongodbEntKrb \
--auth \
--setParameter authenticationMechanisms=GSSAPI \
