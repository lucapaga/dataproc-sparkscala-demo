#!/bin/bash

. 00.variables.sh

gsutil mb -c ${GCS_BUCKET_CLASS} -l ${GCS_BUCKET_ZONE} gs://${GCS_BUCKET_NAME}
gsutil mb -c ${GCS_SRC_BUCKET_CLASS} -l ${GCS_SRC_BUCKET_ZONE} gs://${GCS_SRC_BUCKET_NAME}
