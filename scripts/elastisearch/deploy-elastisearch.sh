#!/bin/bash

context=$1
namespace=$2
releaseSuffix=$3
helmCommand=$4

if [[ -z ${helmCommand} ]]
then
    helmCommand=helm
fi

$helmCommand --kube-context $context --namespace "${namespace}${releaseSuffix}" --name "elastisearch${releaseSuffix}" install ../../helm-charts/elastisearch



