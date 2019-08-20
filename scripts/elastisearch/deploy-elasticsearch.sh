#!/bin/bash

context=$1
namespace=$2
helmCommand=$3

if [[ -z ${helmCommand} ]]
then
    helmCommand=helm
fi

#$helmCommand --kube-context $context --namespace "${namespace}${releaseSuffix}" --name "elastisearch${releaseSuffix}" install ../../helm-charts/elasticsearch
$helmCommand --kube-context $context --namespace "${namespace}" --name "${namespace}-elasticsearch"  install ../../helm-charts/elasticsearch



#helm repo add elastic https://helm.elastic.co


#./deploy-elasticsearch.sh minikube jx "-local"
#./deploy-elasticsearch.sh gke_wildebot-186003_us-central1-c_bot-instances jx-staging
