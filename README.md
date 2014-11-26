docker-kdc
==========

Docker container for a Heimdal Kerberos 5 KDC.

Usable on plain Linux as well as on OSX (via boot2docker). Depending on your host OS, you will need to install additional Kerberos client software for being able to communicate with the KDC. On OSX however, Heimdal Kerberos is already part of the base system.
For installing (Heimdal) Kerberos 5 on your OS, please check the interwebz.


#Usage

###Build the docker image
```
./kdc build
```

This will render the image which is based on plain ubuntu 14.04. Additionally the packages `heimdal-kdc` as well as `libsasl2-modules-gssapi-heimdal` are installed. The latter is useful only if you extend this container image by further applications making use of Kerberos authentication via SASL2's GSSAPI.


###Run the container
```
./kdc start
```

On OSX, this step start by setting up the VM (via boot2docker). The container is started in detached mode, allowing you to keep on working with this shell without having to fork another process. The container name is directly derived from the hostname supplied via the configuration (see [Configuration](#Configuration)).


###Prepare the environment
```
$(./kdc shellinit)
```

A Kerberos client needs access to a configuration file. To prevent having to edit the system wide configuration file (`/etc/krb5.conf`) a local, minimal version is rendered and supplied once the container has gotten started. Additionally, the keytab also gets exported and hence needs to be accesssable for clients making use of password-less authentication. To make use of the files, environment variables that are interpreted by Kerberos clients are prepared for your convenience.


###Render a ticket supplying the principal password
```
kinit tillt/kdc.example.com@EXAMPLE.COM
```

Password: `matilda`

####Check the ticket
```
klist
```

On OSX you could also use the Ticket Viewer to check the details of the issued ticket (`open "/System/Library/CoreServices/Ticket Viewer.app"`).

Example

```
$ klist
Credentials cache: API:42926CE1-63E2-4C66-B2D7-00B2F198182F
        Principal: tillt/kdc.example.com@EXAMPLE.COM

  Issued                Expires               Principal
Nov 26 11:06:25 2014  Nov 26 21:06:25 2014  krbtgt/EXAMPLE.COM@EXAMPLE.COM
```

####Remove the ticket
```
kdestroy
```

###Render a ticket using keytab based authentication
```
kinit -kt krb5.keytab tillt/kdc.example.com@EXAMPLE.COM
```

###Check the ticket
```
klist
```

[...]


###Stop the container
```
./kdc stop
```

This will stop the KDC server, stop and remove the container and additionally remove the temporary keytab and configuration files.

#Reference

./kdc start|stop|build|clean|shellinit

##build

Builds the docker image.

##start

Starts the container in detached mode while also producing a Kerberos configuration file (`krb5.conf`) as well as a Kerberos keytab (`krb5.keytab`) locally. 

Note that the keytab is only readable/usable by the current user unless you change its access rights which is not recommended for production environments.

##stop

Stops the container and deletes `krb5.conf` as well as `krb5.keytab`.

##clean

Removes the docker image.

##shellinit

Renders the environment variables needed for using the KDC.

#Configuration

###Kerberos principal.
PRINCIPAL=${PRINCIPAL:-'tillt'}

###Kerberos principal password.
PASSWORD=${PASSWORD:-'matilda'}

###KDC hostname.
HOST_NAME=${HOST_NAME:-'kdc'}

###External KDC IP.
NATHOST=${NATHOST:-'127.0.0.1'}

###External KDC port.
KDC_PORT=${KDC_PORT:-'48088'}

###Kerberos domain name.
DOMAIN_NAME=${DOMAIN_NAME:-'example.com'}

###Kerberos realm name.
REALM_NAME=${REALM_NAME:-'EXAMPLE.COM'}