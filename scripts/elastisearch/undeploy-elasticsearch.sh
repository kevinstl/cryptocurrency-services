#!/bin/bash

context=$1
namespace=$2
helmCommand=$3

if [[ -z ${helmCommand} ]]
then
    helmCommand=helm
fi

$helmCommand --kube-context $context del --purge "${namespace}-elasticsearch"

#./undeploy-elasticsearch.sh minikube "jx-local"
#./undeploy-elasticsearch.sh gke_wildebot-186003_us-central1-c_bot-instances "jx-staging"
#./undeploy-elasticsearch.sh gke_wildebot-186003_us-central1-c_bot-instances "jx-production"