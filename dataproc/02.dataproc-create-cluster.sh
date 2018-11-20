#!/bin/bash

. 00.variables.sh

gcloud dataproc clusters create ${DATAPROC_CLUSTER_NAME} --region ${DATAPROC_CLUSTER_REGION} --zone ${DATAPROC_CLUSTER_ZONE} --scopes storage-rw
