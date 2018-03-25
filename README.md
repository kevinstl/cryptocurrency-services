# cryptocurrency-services

# mongo
helm install --name gateway-db stable/mongodb
helm del --purge gateway-db


# jhipster registry
helm install --name jhipster-registry helm-charts/jhipster-registry
helm del --purge jhipster-registry


# elastisearch
helm install --name elastisearch helm-charts/elastisearch
helm del --purge elastisearch


#gateway
./mvnw verify -Pprod dockerfile:build
gcloud docker -- push gcr.io/cryptocurrencyservices-197520/cryptocurrency-services-api-gateway:0.1.0

helm del --purge cryptocurrency-services-api-gateway
helm install -n cryptocurrency-services-api-gateway helm-charts/gateway


#masternodes-online-supplement-api
./mvnw verify -Pprod dockerfile:build
gcloud docker -- push gcr.io/cryptocurrencyservices-197520/masternodes-online-supplement-api:0.1.0

helm del --purge masternodes-online-supplement-api
helm install -n masternodes-online-supplement-api helm-charts

