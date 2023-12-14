#!/bin/bash

filename=$1
dest_bucket=$2


if [ -z "$filename" ]; then
    echo "File not specified!"
    exit 1
elif [ -z "$dest_bucket" ]; then
    echo "Destination bucket not specified!"
    exit 1    
fi


if [ ! -f "$filename" ]; then
    echo "File not found!"
    exit 1
elif aws s3 cp $filename $dest_bucket; then
    echo "File uploaded successfully!"
else
    echo "File upload failed!"
    exit 1
fi