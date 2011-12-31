#!/bin/bash

path=$1
ebin=$path/usr/lib/emit/ebin/
emit=$path/usr/bin/emit

mkdir -p $ebin
mkdir -p $ebin/../priv
cp    -v ebin/* $ebin
chmod +r $ebin/*

cp emit.cfg $path/etc/emit.cfg

touch $ebin/../priv/nodeinfo
touch $ebin/../priv/deviceinfo

chmod a+rw $ebin/../priv/nodeinfo
chmod a+rw $ebin/../priv/deviceinfo
chmod a+r $path/etc/emit.cfg

echo "#!/bin/bash" > $emit
echo EBIN="/usr/lib/emit/ebin" >> $emit
echo EMIT="/usr/bin/emit" >> $emit
cat emit.part >> $emit

gcc -o upnp  upnp.c  -lminiupnpc
cp upnp  $ebin/../priv/upnp

chmod +x $emit

