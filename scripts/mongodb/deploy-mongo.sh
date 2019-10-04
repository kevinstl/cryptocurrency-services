#!/bin/bash

context=$1
namespace=$2

mongoUser=$3
mongoPass=$4

nodePort=${5}
releaseName=${6}
mongoDatabase=${7}

echo "context: ${context}"
echo "namespace: ${namespace}"
echo "mongoUser: ${mongoUser}"
echo "mongoPass: ${mongoPass}"
echo "nodePort: ${nodePort}"
echo "releaseName: ${releaseName}"

echo "mongoDatabase: ${mongoDatabase}"


if [[ ${releaseName} == "" ]]
then
    releaseName="gateway-db"
fi

#helm init

#nodePortValueArg=""
#if [[ ${namespace} != "" ]]
#then
#    nodePortValueArg=" --set service.nodePort=${nodePort}"
#fi

mongoDatabaseValueArg=""
if [[ ${mongoDatabase} != "" ]]
then
    mongoDatabaseValueArg=",mongoDatabase=${mongoDatabase}"
fi

serviceTypeValueArg=""
nodePortValueArg=""
if [[ ${nodePort} == "30017" ]]
then
    nodePortValueArg=" --set service.nodePort=${nodePort} "
else
    serviceTypeValueArg=" --set service.type=LoadBalancer "
fi


kubectl --context ${context} create namespace ${namespace}


#Add test database and production database
#helm --kube-context $context --namespace $namespace install --name ${releaseName} --set mongodbRootPassword=admin,mongodbUsername=${MONGO_PROD_TEST_USER},mongodbPassword=${MONGO_PROD_TEST_PASS},mongodbDatabase=${mongoDatabase} ${nodePortValueArg} ../../helm-charts/mongodb


#helm --kube-context $context --namespace $namespace install --name ${releaseName} --set mongodbRootPassword=admin ../../helm-charts/mongodb

#helm --kube-context $context --namespace $namespace install --name ${releaseName} --set mongodbRootPassword=${mongoPass} ../../helm-charts/mongodb

#helm --kube-context $context --namespace $namespace install --name ${releaseName} --set mongodbRootPassword=${mongoPass} ${serviceTypeValueArg} ${nodePortValueArg} ../../helm-charts/mongodb

helm --kube-context $context --namespace $namespace install --name ${releaseName} --set mongodbRootPassword=${mongoPass} ${serviceTypeValueArg} ${nodePortValueArg} ../../helm-charts/mongodb-4_0_12




#./create-mongo-user.sh ${mongoUser} ${mongoPass} ${mongoDatabase}


#These are valid. Disabling for deployment to gke due to static ip requirement
#./create-mongo-user.sh ${mongoUser} ${mongoPass} admin
#./create-mongo-user.sh ${MONGO_PROD_TEST_USER} ${MONGO_PROD_TEST_PASS} admin
#./create-mongo-user.sh ${serviceAdminUser} ${serviceAdminPass} admin


#Examples:
#./deploy-mongo.sh minikube jx-local test-user test-pass admin admin service-admin service-admin-pass ""
#./deploy-mongo.sh minikube wildebot-local test-user test-pass admin admin service-admin service-admin-pass "" "" cryptocurrency-services-mongo

#local
#./deploy-mongo.sh minikube jx-local test-user test-pass admin admin service-admin service-admin-pass ""
#./create-mongo-user.sh test-user test-pass gateway-db-mongodb
#./create-mongo-user.sh admin admin admin
#./create-mongo-user.sh test-user test-pass admin

