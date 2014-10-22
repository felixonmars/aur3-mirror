#!/usr/bin/env bash

java \
    -Dorg.apache.commons.logging.Log=org.apache.commons.logging.impl.SimpleLog \
    -Dorg.apache.commons.logging.simplelog.log.org.apache.http.wire=DEBUG \
    -Dapple.laf.useScreenMenuBar=true \
    -Dapple.awt.application.name=RESTClient \
    -jar /usr/share/rest-client/restclient-ui-jar-with-dependencies.jar
