#!/bin/bash -x
DIALOG=${DIALOG=dialog}

CFGFILE=/etc/kerio-kvc.conf
TITLE='Kerio VPN client setup'
SERVER=`$DIALOG --title "${TITLE}" --clear --stdout  --inputbox "Server" 0 0`
PORT=`$DIALOG --title "${TITLE}" --clear --stdout  --inputbox "Port" 0 0`

USERNAME=`$DIALOG --title "${TITLE}" --clear --stdout  --inputbox "Login" 0 0`
PASS=`$DIALOG --title "${TITLE}" --clear --stdout  --inputbox "Pass" 0 0`

XOR=""
for i in `echo -n "$PASS" | od -t d1 -A n`; do XOR=$(printf "%s%02x" "$XOR" $((i ^ 85))); done

FINGERPRINT=`sh fingerprint.sh ${SERVER}:${PORT}`

#SERVER=`cat /tmp/inputbox.tmp.$$`


#rm -f /tmp/inputbox.tmp.$$

cat > "$CFGFILE" << EOF
<config>
<connections>
<connection type="persistent">
<server>${SERVER}</server>
<port>${PORT}</port>
<username>${USERNAME}</username>
<password>XOR:${XOR}</password>
<fingerprint>${FINGERPRINT}</fingerprint>
<active>1</active>
</connection>
</connections>
</config>
EOF

echo "Your configuration file: $CFGFILE"
echo "For start daemon: /etc/rc.d/kerio-kvc start"