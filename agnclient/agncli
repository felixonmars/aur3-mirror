#!/bin/bash

# agnclient CLI version
# This is more or less a re-write of NetVPN.sh to be more multi-user
# friendly, and more debian-like with the way it discovers things.

# David Zanetti <dzanetti@nz1.ibm.com> 20080115

. /etc/default/agnclient

if [ -z "${SMX_ADDRESS}" ]; then
 echo "Please define SMX_ADDRESS in /etc/default/agnclient"
 exit 1;
fi

if [ -f ~/.agncli ]; then
 . ~/.agncli
fi

if [ -z "${NETVPN_ACCOUNT}" ] || [ -z "${NETVPN_USERNAME}" ] \
   || [ -z "${NETVPN_PASSWORD}" ]; then
 echo "Please define NETVPN_ACCOUNT, NETVPN_USERNAME, and NETVPN_PASSWORD in"
 echo "either /etc/default/agnclient or ~/.agncli"
 exit 1;
fi

VPNCLIENT=/opt/agns/bin/vpnCLI

if [ ! -x ${VPNCLIENT} ]; then
 echo "Cannot execute VPN client binaries, broken packages?"
 exit 1;
fi

# Work out proxy args
if [ -n "${HTTP_PROXY}" ]; then
 if [ -n "${HTTP_PROXY_AUTH}" ]; then
  $PROXY="${HTTP_PROXY} ${HTTP_PROXY_AUTH}"
 else 
  $PROXY="${HTTP_PROXY}"
 fi
fi

# export various things into the environment
export NETVPN_ACCOUNT NETVPN_USERNAME NETVPN_PASSWORD

echo "Using ${NETVPN_ACCOUNT}/${NETVPN_USERNAME} login"

# Actually invoke client
exec ${VPNCLIENT} ${SMX_ADDRESS} ${PROXY}

