#!/bin/bash

context=$1
releaseSuffix=$2
helmCommand=$3


if [[ -z ${helmCommand} ]]
then
    helmCommand=helm
fi

$helmCommand --kube-context $context del --purge "jhipster-registry${releaseSuffix}"

#./undeploy-jhipster.sh minikube