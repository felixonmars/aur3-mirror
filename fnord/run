#!/bin/sh

exec 2>&1

cd /home/fnord

if [ -d rules ]
then
	ipsvd-cdb rules.cdb rules.tmp rules
	RULES="-x rules.cdb"
else
	RULES=""
fi

readdefault() {
        var=$1; shift
        if [ -s config/$var ]
	then
        	export $var="`head -1 config/$var`"
	else
		export $var="$*"
	fi
}

readdefault concurrency 30
readdefault program fnord-idx
readdefault memory 3000000
readdefault port 8000
readdefault bind 0.0.0.0

exec chpst -m${memory} -u fnord \
     tcpsvd ${RULES} -v ${bind} ${port} \
     ${program}
