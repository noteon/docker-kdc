use $external
db.createUser(
   {
     user: "mongodb/lab.mongobooster.com@MONGOBOOSTER.COM",
     roles: [
				{ role: "clusterAdmin", db: "admin" },
                { role: "readWriteAnyDatabase", db: "admin" },
                { role: "readWrite", db: "test" },
            ],
   }
)