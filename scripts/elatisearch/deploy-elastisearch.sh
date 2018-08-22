#!/bin/bash

namespace=$1

helm --namespace $namespace --name elastisearch install ../../helm-charts/elastisearch



