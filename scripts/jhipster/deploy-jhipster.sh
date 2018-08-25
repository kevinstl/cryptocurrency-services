#!/bin/bash

context=$1
namespace=$2
adminPassword=$3
releaseSuffix=$4
helmCommand=$5

if [[ -z ${helmCommand} ]]
then
    helmCommand=helm
fi

$helmCommand --kube-context $context --namespace "${namespace}${releaseSuffix}" --name "jhipster-registry${releaseSuffix}" install ../../helm-charts/jhipster-registry --set security.adminPassword=${adminPassword}





