#!/bin/bash


./undeploy-mongo.sh
helm del --purge jhipster-registry
helm del --purge elastisearch

