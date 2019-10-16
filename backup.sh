#!/bin/sh
export PATH=$PATH:/root/google-cloud-sdk/bin

pg_dumpall | gzip | gsutil cp - gs://$BUCKET/$PERFIX$(date +"%Y%m%d%H%M%S")$SUFFIX.sql.gz
