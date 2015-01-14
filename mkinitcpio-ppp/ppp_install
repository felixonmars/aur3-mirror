#!/bin/bash
build ()
{
  # Are we even needed?
  ls /etc/ppp/peers/* > /dev/null 2>&1
  if [ $? -ne 0 ]; then
      echo "There are no providers configured under /etc/ppp/peers; exit"
      return 0
  fi

  # if TMPDIR is set leave it alone otherwise set
  [ -z $TMPDIR ] && TMPDIR='/tmp/mkinitcpio-ppp'

  # check if TMPDIR exsists if not make it
  [ -d $TMPDIR ] || mkdir -p $TMPDIR

  umask 0022

  add_checked_modules "/drivers/net/"
  add_module "ppp_generic"
  add_module "pppox"
  add_module "pppoe"
  add_binary "pppd"
  add_full_dir /etc/ppp
  add_full_dir /usr/lib/pppd
  add_dir /var/run

  add_runscript
  
}

help ()
{
    cat<<HELPEOF
This hook can be used in combination with the dropbear_initrd_encrypt hooks.
It will look for both "ppp_provider" and "ppp_device" kernel parameters.
The first defines which provider is dialed. The latter determines which
physical device is used in the connection (eth0, eth1, ...). This is
required so your system won't boot in an inconsistent state regarding your
interfaces names.
HELPEOF
}

