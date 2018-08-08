#!/bin/bash

mongoDb=$1

#status=`mongo ${mongoDb} --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin redirect --eval "use ${mongoDb};" | grep switched`
status=`mongo ${mongoDb} --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin redirect --eval "use ${mongoDb};"`

echo mongodb database creation status: $status

if [ "$status" != "switched to db ${mongoDb}" ]
then
    echo "waiting for mongodb to be available so that database may be created"
    sleep 5
    ./create-mongo-database.sh ${mongoDb}
else
    echo "successfully created mongodb database"
fi

