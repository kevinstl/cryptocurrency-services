#!/bin/bash

context=$1
releaseSuffix=$2
helmCommand=$3

if [[ -z ${helmCommand} ]]
then
    helmCommand=helm
fi

$helmCommand --kube-context $context del --purge "keycloak${releaseSuffix}"

#./undeploy-keycloak.sh minikube ""
#./undeploy-elastisearch.sh gke_wildebot-186003_us-central1-c_bot-instances "-staging"
#./undeploy-elastisearch.sh gke_wildebot-186003_us-central1-c_bot-instances "-production"