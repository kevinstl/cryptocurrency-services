#!/bin/bash


message=`mongo admin --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin --eval "db.runCommand( { ping: 1 } )"`

#echo ${message}

status=`echo ${message} | grep ok`

echo mongodb ping status: $status

if [ "$status" == "" ]
then
    echo "waiting for mongodb to be available"
    sleep 5
    ./initialize.sh ${mongoDb}
else
    echo "successfully pinged mongo instance"
fi

