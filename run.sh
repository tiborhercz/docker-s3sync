#!/bin/bash

logFileName=$(date +"%Y-%m-%d_S3SyncLogs.txt")
logFilePath=./logs/
logFileLocation=$logFilePath$logFileName

mkdir -p ~/.aws && touch credentials

echo "[default]" >> ~/.aws/credentials
echo "aws_access_key_id=$ACCESS_KEY" >> ~/.aws/credentials
echo "aws_secret_access_key=$SECRET_KEY" >> ~/.aws/credentials

aws s3 sync /data/ $S3PATH $S3CMDPARAMS >> $logFileLocation
