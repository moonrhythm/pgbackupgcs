#!/bin/sh
export PATH=$PATH:/root/google-cloud-sdk/bin

pg_dumpall > dump || exit 1
gsutil cp -Z dump gs://$BUCKET/$PERFIX$(date +"%Y%m%d%H%M%S")$SUFFIX
