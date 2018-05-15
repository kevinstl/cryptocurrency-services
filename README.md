# cryptocurrency-services


# API Gateway

https://github.com/kevinstl/cryptocurrency-services-api-gateway

# Masternodes Online Supplement API

https://github.com/kevinstl/masternodes-online-supplement-api

# Deploy Using Helm

## mongo
helm install --name gateway-db stable/mongodb
helm del --purge gateway-db


## jhipster registry
helm install --name jhipster-registry helm-charts/jhipster-registry
helm install --name jhipster-registry helm-charts/jhipster-registry --set security.adminPassword=********
helm del --purge jhipster-registry


## elastisearch
helm install --name elastisearch helm-charts/elastisearch
helm del --purge elastisearch










