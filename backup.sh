#!/bin/sh
export PATH=$PATH:/root/google-cloud-sdk/bin

pg_dumpall | gsutil cp -Z - gs://$BUCKET/$PERFIX$(date +"%Y%m%d%H%M%S")$SUFFIX
