#!/bin/bash

context=$1
namespace=$2

export MONGO_PROD_TEST_USER=$3
export MONGO_PROD_TEST_PASS=$4

mongoUser=$5
mongoPass=$6
mongoDb=$7



helm --kube-context $context --namespace $namespace install --name gateway-db --set mongodbRootPassword=admin,mongodbUsername=${MONGO_PROD_TEST_USER},mongodbPassword=${MONGO_PROD_TEST_PASS},mongodbDatabase=${mongoDb} ../../helm-charts/mongodb

#./create-mongo-user.sh ${mongoUser} ${mongoPass} ${mongoDb}
./create-mongo-user.sh ${mongoUser} ${mongoPass} admin

#./deploy-mongo.sh minikube cryptocurrency-services test-user test-pass admin admin cryptocurrency-services-local-test



