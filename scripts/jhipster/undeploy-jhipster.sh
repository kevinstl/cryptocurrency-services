#!/bin/bash

context=$1
#releaseSuffix=$2
namespace=$2
helmCommand=$3


if [[ -z ${helmCommand} ]]
then
    helmCommand=helm
fi

#$helmCommand --kube-context $context del --purge "jhipster-registry${releaseSuffix}"
$helmCommand --kube-context $context del --purge "${namespace}-jhipster-registry"

#./undeploy-jhipster.sh minikube jx-local
#./undeploy-jhipster.sh gke_wildebot-186003_us-central1-c_bot-instances jx-staging
#./undeploy-jhipster.sh gke_wildebot-186003_us-central1-c_bot-instances jx-production