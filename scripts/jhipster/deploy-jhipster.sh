#!/bin/bash

context=$1
namespace=$2
adminPassword=$3
#releaseSuffix=$4
helmCommand=$4
serviceType=$5
nodePort=$6



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

#$helmCommand --kube-context $context --namespace "${namespace}${releaseSuffix}" ${serviceTypeValueArg} ${nodePortValueArg} --name "jhipster-registry${releaseSuffix}" install ../../helm-charts/jhipster-registry --set security.adminPassword=${adminPassword}
$helmCommand --kube-context $context --namespace "${namespace}" ${serviceTypeValueArg} ${nodePortValueArg} --name "${namespace}-jhipster-registry" install ../../helm-charts/jhipster-registry --set security.adminPassword=${adminPassword}


#./deploy-jhipster.sh minikube jx-local admin "" NodePort 30761
#./deploy-jhipster.sh gke_wildebot-186003_us-central1-c_bot-instances jx-staging admin "" "" ""
#./deploy-jhipster.sh gke_wildebot-186003_us-central1-c_bot-instances jx-production admin "" "" ""