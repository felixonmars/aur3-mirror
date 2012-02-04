#!/bin/sh
java_path=`which java`
schemaspy_path='/opt/schemaspy/schemaSpy_4.1.1.jar'
$java_path -jar "$schemaspy_path" $*
