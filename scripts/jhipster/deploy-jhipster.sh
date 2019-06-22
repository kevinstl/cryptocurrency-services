#!/bin/bash

context=$1
namespace=$2
adminPassword=$3
releaseSuffix=$4
helmCommand=$5
serviceType=$6
nodePort=$7



if [[ -z ${helmCommand} ]]
then
    helmCommand=helm
fi

serviceTypeValueArg=""
if [[ ${serviceType} != "" ]]
then
    serviceTypeValueArg=" --set service.type=${serviceType}"
fi

nodePortValueArg=""
if [[ ${nodePort} != "" ]]
then
    nodePortValueArg=" --set service.nodePort=${nodePort}"
fi

$helmCommand --kube-context $context --namespace "${namespace}${releaseSuffix}" ${serviceTypeValueArg} ${nodePortValueArg} --name "jhipster-registry${releaseSuffix}" install ../../helm-charts/jhipster-registry --set security.adminPassword=${adminPassword}


#./deploy-jhipster.sh minikube jx admin "-local" "" NodePort 30761






