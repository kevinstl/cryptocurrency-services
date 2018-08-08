#!/bin/bash


export MONGO_PROD_TEST_USER=$1
export MONGO_PROD_TEST_PASS=$2

mongoUser=$3
mongoPass=$4
mongoDb=$5



helm --namespace default install --name gateway-db --set mongodbRootPassword=admin,mongodbUsername=${MONGO_PROD_TEST_USER},mongodbPassword=${MONGO_PROD_TEST_PASS},mongodbDatabase=cryptocurrency-services-local-test ../../helm-charts/mongodb

./create-mongo-user.sh ${mongoUser} ${mongoPass} ${mongoDb}


