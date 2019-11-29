python -m \
    apache_beam.examples.wordcount \
    --project unibo-demo --runner \
    DataflowRunner --temp_location \
    gs://unibo-demo/temp --output \
    gs://unibo-demo/results/output \
    --job_name dataflow-intro