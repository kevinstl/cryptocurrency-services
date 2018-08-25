#!/bin/bash

context=$1

helm --kube-context $context del --purge gateway-db

