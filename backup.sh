#!/bin/sh
export PATH=$PATH:/root/google-cloud-sdk/bin

if [[ -z "${PGDATABASE}" ]]; then
  pg_dumpall | gzip | gsutil cp - gs://$BUCKET/$PREFIX$(date +"%Y%m%d%H%M%S")$SUFFIX.sql.gz
else
  pg_dump | gzip | gsutil cp - gs://$BUCKET/$PREFIX$(date +"%Y%m%d%H%M%S")$SUFFIX.sql.gz
fi
