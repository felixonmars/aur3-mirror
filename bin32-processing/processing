#!/bin/sh

# path to java binary
JAVA_PATH="/opt/java32"

# processing install path
PROCESSING_PATH="/opt/bin32-processing"

# set java paths
export PATH="${JAVA_PATH}/bin:${PATH}"
export CLASSPATH="${JAVA_PATH}/lib/rt.jar:${JAVA_PATH}/lib/tools.jar:${JAVA_PATH}/lib:${CLASSPATH}"

# set processing lib paths
for LIB in ${PROCESSING_PATH}/lib/*.jar; do
	export CLASSPATH="${CLASSPATH}:${LIB}"
done

# user.dir is set to correct working directory
java -Duser.dir=${PROCESSING_PATH} processing.app.Base
