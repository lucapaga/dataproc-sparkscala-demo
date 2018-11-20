#!/bin/bash

. 00.variables.sh

./02.dataproc-create-cluster.sh 
#./03.deploy-code.sh
./04.dataproc-run-job.sh
./05.dataproc-delete-cluster.sh

