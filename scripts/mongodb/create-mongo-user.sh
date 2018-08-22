#!/bin/bash

mongoUser=$1
mongoPass=$2
mongoDb=$3

echo "mongoUser: ${mongoUser} mongoPass: ${mongoPass} mongoDb: ${mongoDb}"

echo "mongo ${mongoDb} --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin"

message=`mongo ${mongoDb} --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin --eval "db.runCommand({createUser : \"${mongoUser}\",pwd: \"${mongoPass}\", roles: [{role:\"root\", db:\"${mongoDb}\"}] });"`

#message=`mongo admin --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin --eval "db.runCommand({createUser : \"${mongoUser}\",pwd: \"${mongoPass}\", roles: [{role:\"root\", db:\"${mongoDb}\"}] });"`

echo ${message}

status=`echo ${message} | grep ok`

echo mongodb user creation status: $status
if [ "$status" == "" ]
then
    echo "waiting for mongodb to be available so that user may be created"
    sleep 5
    ./create-mongo-user.sh ${mongoUser} ${mongoPass} ${mongoDb}
else
    echo "successfully created mongodb user"
fi

#mongo --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin redirect --eval 'db.createUser({user: "admin",pwd: "admin", roles: [{ role: "readWrite", db: "admin" }]})'
#mongo --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin redirect --eval 'db.runCommand( { serverStatus: 1 } )'

#mongostat  --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin

#db.runCommand({createUser : "admin", pwd: "admin", roles: [{ role: "clusterAdmin", db: "admin" }]});

#db.createRole( { role: "gatewayAdmin", privileges: [], roles: [ { role: "root", db: "gateway" } ] } )