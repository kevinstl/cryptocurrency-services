#!/bin/bash

context=$1
releaseSuffix=$2
helmCommand=$3


if [[ -z ${helmCommand} ]]
then
    helmCommand=helm
fi

$helmCommand --kube-context $context del --purge "jhipster-registry${releaseSuffix}"

#./undeploy-jhipster.sh minikube -local
#./undeploy-jhipster.sh gke_wildebot-186003_us-central1-c_bot-instances -staging