#!/bin/bash

. 00.variables.sh

gsutil cp ${SCALA_JAR_FILE} gs://${GCS_SRC_BUCKET_NAME}/


