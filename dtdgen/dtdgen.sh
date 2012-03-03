#!/bin/sh

if [ $# != 1 ]; then
	echo "Usage: $(basename $0) input.xml" && exit 1
fi

java -cp /usr/share/java/dtdgen/dtdgen.jar DTDGenerator "$@"
