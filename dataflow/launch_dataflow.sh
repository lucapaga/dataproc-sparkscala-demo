. ../dataproc/00.variables.sh

DATA_FILE_URI=gs://${GCS_BUCKET_NAME}/${DATA_FILE}
if [ "$1" == "RUN_SINGLE" ]
then
    DATA_FILE_URI=gs://${GCS_BUCKET_NAME}/${DATA_FILE_SINGLE}
fi

DATAFLOW_JOB_NAME=dataflow-wc-$(date +%Y%m%d-%H%M%S)

DATAFLOW_RUNNER=DataflowRunner
#DATAFLOW_RUNNER=DirectRunner

echo "Running Dataflow to process \'${DATA_FILE_URI}\' data file(s)"
echo "  -> Job is: \'${DATAFLOW_JOB_NAME}\''"

#exit 1

python3 -m \
    wordcount.wordcount \
    --project ${GCP_PROJECT} \
    --runner ${DATAFLOW_RUNNER} \
    --input ${DATA_FILE_URI} \
    --temp_location ${DATAFLOW_TEMP_PATH} \
    --output ${DATAFLOW_OUTPUT_PATH} \
    --job_name ${DATAFLOW_JOB_NAME}
