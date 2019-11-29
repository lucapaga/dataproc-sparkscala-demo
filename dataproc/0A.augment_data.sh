#!/bin/bash
. 00.variables.sh

cd ${DATA_AUGMENTATION_DIRECTORY}

rm -f *.txt
gsutil -m cp gs://${GCS_BUCKET_NAME}/data/* ./
#cp data/*.txt data_agumented/

echo "Bella! Si comincia ..."

for aFile in $(ls ./)
do
	counter=0
	while true
	do
		TARGET_FILE_REPLICA_NAME="$(echo ${aFile} | sed 's/\.txt//g')_${counter}.txt"
                echo "cp ${aFile} ${TARGET_FILE_REPLICA_NAME}"
		cp ${aFile} ${TARGET_FILE_REPLICA_NAME}

		if [[ "$counter" -gt ${FILE_REPLICA_SIZE} ]]
		then
			echo "Cloned '${aFile}' ${counter} times"
			break;
		else
			counter=$((counter+1))
		fi
	done
	#echo ${aFile}
done

gsutil -m cp "./*" gs://${GCS_BUCKET_NAME}/data_augmented/

echo "DONE!"
