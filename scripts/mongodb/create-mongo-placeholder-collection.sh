#!/bin/bash

mongoDb=$1

./initialize.sh

message=`mongo ${mongoDb} --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin --eval "db.placeholder.insert({ item: \"item1\" });"`

echo ${message}

status=`echo ${message} | grep nInserted`

echo "mongodb placeholder collection creation status: $status"

if [ "$status" == "" ]
then
    echo "waiting for mongodb to be available so that placeholder collection may be created"
    sleep 5
    ./create-mongo-placeholder-collection.sh ${mongoDb}
else
    echo "successfully created mongodb placeholder collection"
fi

