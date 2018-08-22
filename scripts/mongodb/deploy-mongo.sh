#!/bin/bash

namespace=$1

export MONGO_PROD_TEST_USER=$2
export MONGO_PROD_TEST_PASS=$3

mongoUser=$4
mongoPass=$5
mongoDb=$6



helm --namespace $namespace install --name gateway-db --set mongodbRootPassword=admin,mongodbUsername=${MONGO_PROD_TEST_USER},mongodbPassword=${MONGO_PROD_TEST_PASS},mongodbDatabase=${mongoDb} ../../helm-charts/mongodb

#./create-mongo-user.sh ${mongoUser} ${mongoPass} ${mongoDb}
./create-mongo-user.sh ${mongoUser} ${mongoPass} admin


