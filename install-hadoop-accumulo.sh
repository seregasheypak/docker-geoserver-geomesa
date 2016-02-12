#!/usr/bin/env bash
#
# Copyright (c) 2013-2015 Commonwealth Computer Research, Inc.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Apache LICENSE,_VERSION 2.0 which
# accompanies this distribution and is available at
# http://www.opensource.org/licenses/apache2.0.php.
#

if [[ (-z "$1") ]]; then
    echo "Error: Provide one arg which is the target directory (e.g. /opt/jboss/standalone/deployments/geoserver.war/WEB-INF/lib)"
    exit
else
    install_dir=$1
    GEOMESA_VERSION=1.2.0 
    ACCUMULO_VERSION=1.6.2
    HADOOP_VERSION=2.7.2
    THRIFT_VERSION=0.9.1
    ZOOKEEPER_VERSION=3.4.5 
    NL=$'\n'
    read -r -p "Install accumulo and hadoop dependencies to ${install_dir}?${NL}Confirm? [Y/n]" confirm
    confirm=${confirm,,} #lowercasing
    if [[ $confirm =~ ^(yes|y) ]]; then
        # get stuff
        declare -a urls=(
            "https://search.maven.org/remotecontent?filepath=org/apache/accumulo/accumulo-core/${ACCUMULO_VERSION}/accumulo-core-${ACCUMULO_VERSION}.jar"
            "https://search.maven.org/remotecontent?filepath=org/apache/accumulo/accumulo-fate/${ACCUMULO_VERSION}/accumulo-fate-${ACCUMULO_VERSION}.jar"
            "https://search.maven.org/remotecontent?filepath=org/apache/accumulo/accumulo-trace/${ACCUMULO_VERSION}/accumulo-trace-${ACCUMULO_VERSION}.jar"
            "https://search.maven.org/remotecontent?filepath=org/apache/thrift/libthrift/${THRIFT_VERSION}/libthrift-${THRIFT_VERSION}.jar"
            "https://search.maven.org/remotecontent?filepath=org/apache/zookeeper/zookeeper/${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.jar"
            "https://search.maven.org/remotecontent?filepath=commons-configuration/commons-configuration/1.6/commons-configuration-1.6.jar"
            "https://search.maven.org/remotecontent?filepath=org/apache/hadoop/hadoop-auth/${HADOOP_VERSION}/hadoop-auth-${HADOOP_VERSION}.jar"
            "https://search.maven.org/remotecontent?filepath=org/apache/hadoop/hadoop-client/${HADOOP_VERSION}/hadoop-client-${HADOOP_VERSION}.jar"
            "https://search.maven.org/remotecontent?filepath=org/apache/hadoop/hadoop-common/${HADOOP_VERSION}/hadoop-common-${HADOOP_VERSION}.jar"
            "https://search.maven.org/remotecontent?filepath=org/apache/hadoop/hadoop-hdfs/${HADOOP_VERSION}/hadoop-hdfs-${HADOOP_VERSION}.jar"
            )

        for x in "${urls[@]}"; do
            fname=$(basename "$x");
            echo "fetching ${x}";
            wget -O "${1}/${fname}" "$x";
         done
    else
        echo "Installation cancelled"
    fi
fi