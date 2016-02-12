#!/bin/bash
docker kill geoserver
docker rm geoserver

DATA_DIR=~/geoserver_data
if [ ! -d $DATA_DIR ]
then
    mkdir -p $DATA_DIR
fi 

docker run \
	--name "geoserver"  \
	--link master1:master1.gt \
	-p 8082:8080 \
	-d \
	-t kartoza/geoserver