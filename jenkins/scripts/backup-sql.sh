#!/bin/bash

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_ID=$4
AWS_SECRET=$5
BUCKET_NAME=$6

DATE=$(date +%Y-%m-%d-%H-%M-%S)
BACKUP=db-$DATE.sql

mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME >/tmp/db-$DATE.sql &&
    export AWS_ACCESS_KEY_ID=$AWS_ID &&
    export AWS_SECRET_ACCESS_KEY=$AWS_SECRET &&
    echo "Uploading $BACKUP" &&
    aws s3 cp /tmp/db.sql s3://$BUCKET_NAME/$BACKUP
