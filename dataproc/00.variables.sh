#!/bin/bash

RUN_SESSION=20191122141000

GCP_PROJECT=unibo-demo

GCS_BUCKET_NAME=${GCP_PROJECT}-data-bucket
GCS_BUCKET_ZONE=europe-west1
GCS_BUCKET_CLASS=regional

GCS_SRC_BUCKET_NAME=${GCP_PROJECT}-src-bucket
GCS_SRC_BUCKET_ZONE=europe-west1
GCS_SRC_BUCKET_CLASS=regional

SCALA_JAR_FILENAME=spark-scala-dataproc-unibo-demo_2.11-1.0.0.jar
SCALA_JAR_FILE=codebase/release/${SCALA_JAR_FILENAME}
#SCALA_JAR_FILE_LOCALPATH=file://$(pwd)
SCALA_RUNNABLE_CLASS=it.injenia.demo.dataproc.unibo.SparkWordCount

#SCALA_JAR_FILE_FOR_JOB_SUBMIT=${SCALA_JAR_FILE_LOCALPATH}/${SCALA_JAR_FILE}
SCALA_JAR_FILE_FOR_JOB_SUBMIT=gs://${GCS_SRC_BUCKET_NAME}/${SCALA_JAR_FILENAME}

#DATA_FILE_SINGLE=all-shakespeare-2.txt
#DATA_FILE=data/shakespeare-*.txt

DATA_FILE_SINGLE=data_augmented_single_file/shakespeare-all-r100-onefile.txt
DATA_FILE=data_augmented/shakespeare-*.txt

DATA_AUGMENTATION_DIRECTORY=data_augmented
FILE_REPLICA_SIZE=100

DATAPROC_CLUSTER_NAME=unibo-dataproc-cluster-${RUN_SESSION}
DATAPROC_CLUSTER_REGION=europe-west1
DATAPROC_CLUSTER_ZONE=europe-west1-d
DATAPROC_OUTPUT_PATH=gs://${GCS_BUCKET_NAME}/output/${RUN_SESSION}/$(date +%Y%m%d_%H%M%S)
DATAPROC_SCALEUP_TO_NUMWORKERS=150
