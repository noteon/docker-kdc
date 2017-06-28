env KRB5_KTNAME=/home/ubuntu/git-projects/qh-docker-kdc/krb5.keytab \
/user/bin/mongod \
--port 27040 \
--auth \
--smallfiles
--setParameter authenticationMechanisms=GSSAPI \
 --dbpath=/mnt/mongodb/mongodbEntKrb