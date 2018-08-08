#!/bin/bash


message=`mongo gateway --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin redirect --eval "db.createRole( { role: \"gatewayAdmin\", privileges: [{resource: { db: gateway }}], roles: [ { role: \"dbOwner\", db: \"gateway\" } ] } )"`

echo ${message}

status=`echo ${message} | grep ok`

echo mongodb role creation status: $status

if [ "$status" != "{ "ok" : 1 }" ]
then
    echo "waiting for mongodb to be available so that role may be created"
    sleep 5
    ./create-mongo-database.sh ${mongoDb}
else
    echo "successfully created mongodb role"
fi

