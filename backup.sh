#!/bin/sh
pg_dumpall > dump || exit 1
gsutil cp -Z dump gs://$BUCKET/$PERFIX$(date +"%Y%m%d%H%M%S")$SUFFIX
