#!/bin/bash
wget http://sourceforge.net/projects/geoserver/files/GeoServer/2.8.2/extensions/geoserver-2.8.2-wps-plugin.zip -P /tmp/
unzip -d /opt/geoserver/webapps/geoserver/WEB-INF/lib/ /tmp/geoserver-2.8.2-wps-plugin.zip
#tar xzvf /tmp/geomesa-accumulo-gs-plugin-1.2.0-SNAPSHOT-install.tar.gz  -C /opt/geoserver/webapps/geoserver/WEB-INF/lib/ 
mv /tmp/resources/geomesa-accumulo-gs-plugin-1.2.0-SNAPSHOT-install/* /opt/geoserver/webapps/geoserver/WEB-INF/lib/ 
rm /opt/geoserver/webapps/geoserver/WEB-INF/web.xml
mv /tmp/resources/web.xml /opt/geoserver/webapps/geoserver/WEB-INF/
echo Y | /tmp/install-hadoop-accumulo.sh /opt/geoserver/webapps/geoserver/WEB-INF/lib/
