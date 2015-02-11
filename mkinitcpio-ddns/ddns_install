#!/bin/bash
build ()
{
  # Are we even needed?
  if [ ! -s /etc/inadyn-mt.conf ]; then
      echo "There is no inadyn-mt configuration file; exit"
      return 0
  fi

  # if TMPDIR is set leave it alone otherwise set
  [ -z $TMPDIR ] && TMPDIR='/tmp/mkinitcpio-ddns'

  # check if TMPDIR exsists if not make it
  [ -d $TMPDIR ] || mkdir -p $TMPDIR

  umask 0022

  add_file /etc/inadyn-mt.conf
  # add the libraries needed for name resolution
  add_file /usr/lib32/libresolv.so.2
  add_file /usr/lib32/libnss_dns.so.2
  # this library is needed by the binary, but it's not linked to it
  add_file /usr/lib32/libgcc_s.so.1
  add_binary /usr/bin/inadyn-mt

  add_runscript
  
}

help ()
{
    cat<<HELPEOF
This hook is used with the dropbear_initrd_encrypt hook to provide ddns
capabilities to the early userspace.
HELPEOF
}
