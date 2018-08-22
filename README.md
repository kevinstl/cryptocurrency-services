# cryptocurrency-services


# API Gateway

https://github.com/kevinstl/cryptocurrency-services-api-gateway

# Masternodes Online Supplement API

https://github.com/kevinstl/masternodes-online-supplement-api

# Deploy Using Helm

## mongo
kubectl create namespace cryptocurrency-services
helm --namespace cryptocurrency-services install --name gateway-db helm-charts/mongodb
helm del --purge gateway-db


## jhipster registry
helm install --name jhipster-registry helm-charts/jhipster-registry
helm install --name jhipster-registry helm-charts/jhipster-registry --set security.adminPassword=********
helm del --purge jhipster-registry


## elastisearch
helm install --name elastisearch helm-charts/elastisearch
helm del --purge elastisearch

./deploy-elastisearch.sh cryptocurrency-services


## nexus
helm --kube-context gke_cryptocurrencyservices-197520_us-central1-a_masternodes-online-supplement install stable/sonatype-nexus


## jenkins seed

curl -H "Content-Type: text/xml" -XPOST http://minikube:30010/createItem?name=jenkins-pipeline-k8s-declaritive-seed --data-binary "@./spring-cloud-pipelines-master/config-jenkins-pipeline-k8s-declaritive-seed.xml"
curl -H "Content-Type: text/xml" -XPOST http://minikube:30010/createItem?name=jenkins-pipeline-k8s-seed --data-binary "@./spring-cloud-pipelines-master/config-jenkins-pipeline-k8s-seed.xml"







