#!/bin/bash

#helm --namespace cryptocurrency-services install --name gateway-db stable/mongodb
#helm --namespace cryptocurrency-services install --name jhipster-registry helm-charts/jhipster-registry --set security.adminPassword=password
#helm --namespace cryptocurrency-services install --name elastisearch helm-charts/elastisearch

#helm --namespace default install --name gateway-db helm-charts/mongodb
./deploy-mongo.sh
helm --namespace default install --name jhipster-registry helm-charts/jhipster-registry --set security.adminPassword=admin
helm --namespace default install --name elastisearch helm-charts/elastisearch