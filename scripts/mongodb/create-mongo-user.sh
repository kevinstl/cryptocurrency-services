#!/bin/bash

mongoUser=$1
mongoPass=$2
mongoDatabase=$3
role=$4
host=$5
adminPass=$6
port=$7

echo "mongoUser: ${mongoUser}"
echo "mongoPass: ${mongoPass}"
echo "mongoDatabase: ${mongoDatabase}"
echo "role: ${role}"
echo "host: ${host}"
echo "adminPass: ${adminPass}"
echo "port: ${port}"

if [[ ${role} == "" ]]
then
    role="root"
fi

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

echo "mongoUser: ${mongoUser} mongoPass: ${mongoPass} mongoDatabase: ${mongoDatabase} role: ${role} host: ${host}"

#echo "mongo admin --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin"
echo "mongo admin --host ${host} --port 30017 -u root -p admin --authenticationDatabase admin"
#echo "mongo ${mongoDatabase} --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin"

#message=`mongo admin --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin --eval "db.runCommand({createUser : \"${mongoUser}\",pwd: \"${mongoPass}\", roles: [{role:\"${role}\", db:\"${mongoDatabase}\"}] });"`

#message=`mongo ${mongoDatabase} --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin --eval "db.runCommand({createUser : \"${mongoUser}\",pwd: \"${mongoPass}\", roles: [{role:\"${role}\", db:\"${mongoDatabase}\"}] });"`

message=`mongo ${mongoDatabase} --host ${host} --port ${port} -u root -p ${adminPass} --authenticationDatabase admin --eval "db.runCommand({createUser : \"${mongoUser}\",pwd: \"${mongoPass}\", roles: [{role:\"${role}\", db:\"${mongoDatabase}\"}] });"`

echo "create-mongo-user.sh: message: ${message}"

status=`echo ${message} | grep ok`

echo mongodb user creation status: $status
if [ "$status" == "" ]
then
    echo "waiting for mongodb to be available so that user may be created"
    sleep 5
    ./create-mongo-user.sh ${mongoUser} ${mongoPass} ${mongoDatabase} ${host}
else
    echo "successfully created mongodb user"
fi

#mongo --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin redirect --eval 'db.createUser({user: "admin",pwd: "admin", roles: [{ role: "readWrite", db: "admin" }]})'
#mongo --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin redirect --eval 'db.runCommand( { serverStatus: 1 } )'

#mongostat  --host minikube-easy --port 30017 -u root -p admin --authenticationDatabase admin

#db.runCommand({createUser : "admin", pwd: "admin", roles: [{ role: "clusterAdmin", db: "admin" }]});

#db.createRole( { role: "gatewayAdmin", privileges: [], roles: [ { role: "root", db: "gateway" } ] } )


#./create-mongo-user.sh username password mongo-database readWrite