use $external
db.createUser(
   {
     user: "mongodb/qhmongo-virtualbox@MONGOBOOSTER.COM",
     roles: [
				{ role: "clusterAdmin", db: "admin" },
                { role: "readWriteAnyDatabase", db: "admin" },
                { role: "readWrite", db: "test" },
            ],
   }
)