#!/bin/bash

context=$1
releaseName=$2

echo "releaseName: ${releaseName}"


if [[ ${releaseName} == "" ]]
then
    releaseName="gateway-db"
fi

helm --kube-context $context del --purge ${releaseName}

#./undeploy-mongo.sh minikube cryptocurrency-services-mongodb