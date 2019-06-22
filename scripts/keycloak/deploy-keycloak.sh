#!/bin/bash

context=$1
namespace=$2
releaseSuffix=$3
helmCommand=$4

if [[ -z ${helmCommand} ]]
then
    helmCommand=helm
fi

$helmCommand --kube-context $context --namespace "${namespace}${releaseSuffix}" --name "keycloak${releaseSuffix}" install ../../helm-charts/keycloak

#helm install --name keycloak codecentric/keycloak

#./deploy-keycloak.sh minikube jx "-local"
