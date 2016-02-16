# docker-geoserver

This Container contains

  * GeoServer 2.8.2
  * WPS-Plugin
  * GeoMesa Erweiterung

Developed for cooperation with Versions:

* geomesa 1.2.0
* accumulo 1.6.2
* hadoop 2.7.2
* thrift 0.9.1
* zookeeper 3.4.5

## Creating the Image

docker build -t fzi/geoserver .

## Run the Container

docker run --name "geoserver"  --link master1:master1.gt -p 8082:8080 -d -t fzi/geoserver

**Note:** The server needs a couple of minutes to startup. You can check it's status with `docker logs geoserver`

**Note:** The default geoserver user is 'admin' and the password is 'geoserver'.

## Nutzung eines Data-Only Containers


Docker volumes can be used to persist your data.

```
mkdir -p ~/geoserver_data
docker run -d -v $HOME/geoserver_data:/opt/geoserver/data_dir kartoza/geserver
```

You need to ensure the ``geoserver_data`` directory has sufficinet permissions
for the docker process to read / write it.

## Konfigurieren des DataStores


Docker volumes can be used to persist your data.

```
mkdir -p ~/geoserver_data
docker run -d -v $HOME/geoserver_data:/opt/geoserver/data_dir kartoza/geserver
```

You need to ensure the ``geoserver_data`` directory has sufficinet permissions
for the docker process to read / write it.