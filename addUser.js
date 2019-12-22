use $external
db.createUser(
   {
     user: "mongodb/sg.mongobooster.com@SG.MONGOBOOSTER.COM",
     roles: [
				{ role: "clusterAdmin", db: "admin" },
                { role: "readWriteAnyDatabase", db: "admin" },
                { role: "readWrite", db: "test" },
            ],
   }
)

db.createUser(
  {
    user: "mongodb/lab.mongobooster.com@LAB.MONGOBOOSTER.COM",
    roles: [
       { role: "clusterAdmin", db: "admin" },
               { role: "readWriteAnyDatabase", db: "admin" },
               { role: "readWrite", db: "test" },
           ],
  }
)