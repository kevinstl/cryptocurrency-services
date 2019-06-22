#!/bin/bash

mongoUser=$1
host=$2
adminPass=$3
port=$4

echo "mongoUser: ${mongoUser}"
echo "host: ${host}"
echo "adminPass: ${adminPass}"
echo "port: ${port}"


if [[ ${host} == "" ]]
then
    host="minikube-easy"
fi

if [[ ${adminPass} == "" ]]
then
    adminPass="admin"
fi

if [[ ${port} == "" ]]
then
    port="30017"
fi

#message=`mongo admin --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin redirect --eval "db.runCommand({dropUser : \"${mongoUser}\"});" | grep ok`

message=`mongo admin --host ${host} --port ${port} -u root -p ${adminPass} --authenticationDatabase admin redirect --eval "db.runCommand({dropUser : \"${mongoUser}\"});" | grep ok`

echo mongodb user drop message: ${message}

status=`echo ${message} | grep ok`

if [ "$status" == "" ]
then
    echo "waiting for mongodb to be available so that user may be dropped"
    sleep 5
    ./drop-mongo-user.sh ${mongoUser} ${host} ${adminPass} ${port}
else
    echo "successfully dropped mongodb user"
fi


#./drop-mongo-user.sh kevin-wilde 35.222.186.88 xxxx 27017

