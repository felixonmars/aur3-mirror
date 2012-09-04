#!/bin/sh

RET=$1

SCL_STDOUT=/tmp/kerio-kvc.stdout
SCL_STDERR=/tmp/kerio-kvc.stderr
SCL_EXIT=/tmp/kerio-kvc.exit

set +e; echo | openssl s_client -ssl3 -connect "$RET" > $SCL_STDOUT 2>$SCL_STDERR; echo $? > $SCL_EXIT;

if [ `cat $SCL_EXIT` == 0 ]; then
cat $SCL_STDOUT | openssl x509 -fingerprint -md5 -noout | sed s'/.*=//';
rm -f $SCL_STDOUT $SCL_STDERR $SCL_EXIT;
fi 