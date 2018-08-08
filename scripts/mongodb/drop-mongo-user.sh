#!/bin/bash

mongoUser=$1

message=`mongo admin --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin redirect --eval "db.runCommand({dropUser : \"${mongoUser}\"});" | grep ok`

echo mongodb user drop message: ${message}

status=`echo ${message} | grep ok`

if [ "$status" == "" ]
then
    echo "waiting for mongodb to be available so that user may be created"
    sleep 5
    ./create-mongo-user.sh
else
    echo "successfully dropped mongodb user"
fi

