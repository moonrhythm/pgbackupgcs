pg_dumpall -h $PGHOST > dump
gsutil cp -Z dump gs://$BUCKET/$PERFIX$(date +"%Y%m%d%H%M%S")$SUFFIX
