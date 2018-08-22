#!/bin/bash

namespace=$1
adminPassword=$2

helm --namespace $namespace --name jhipster install ../../helm-charts/jhipster-registry --set security.adminPassword=${adminPassword}



