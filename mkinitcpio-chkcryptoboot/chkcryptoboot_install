#!/bin/bash
build ()
{
  # Are we even needed?
  if [ ! -s /etc/default/chkcryptoboot.conf ]; then
      echo "There is no chkcryptoboot configuration file; exit"
      return 0
  else
      source /etc/default/chkcryptoboot.conf
  fi

  # if TMPDIR is set leave it alone otherwise set
  [ -z $TMPDIR ] && TMPDIR='/tmp/mkinitcpio-chkcryptoboot'

  # check if TMPDIR exsists if not make it
  [ -d $TMPDIR ] || mkdir -p $TMPDIR

  umask 0400

  add_dir /etc/chkcryptoboot

  if [ -n "$BOOTMODE" ]; then
      if [ $BOOTMODE = "mbr" ]; then
	  if [ -n "$BOOTDISK" ]; then
	      #only backup first 446 bytes of disk
	      dd if=$BOOTDISK of=$TMPDIR/disk-head bs=446 count=1
	      cd $TMPDIR
	      sha512sum disk-head > $TMPDIR/disk-head.sha512
	      add_file $TMPDIR/disk-head.sha512 /etc/chkcryptoboot
	  else
	      echo "No BOOTDISK configured; exit"
	      return 0
	  fi
      elif [ $BOOTMODE = "efi" ]; then
	  if [ -n "$ESP" ]; then
	      if [ -n "$EFISTUB" -a -s $EFISTUB ]; then
		  findmnt $ESP --fstab -n --output=source,target,fstype,options,freq,passno > $TMPDIR/fstab
		  if [ $? != 0 ];then
		      echo "Your ESP mount point was not found in /etc/fstab; exit"
		      return 0
		  else
		      add_module `findmnt $ESP --fstab -n --output=fstype`
		      add_dir `findmnt $ESP --fstab -n --output=target`
		  fi
		  #hash grub efistub
		  sha512sum $EFISTUB > $TMPDIR/efistub.sha512
		  add_file $TMPDIR/efistub.sha512 /etc/chkcryptoboot
		  add_file $TMPDIR/fstab /etc/fstab
		  add_binary /usr/bin/findmnt
	      else
		  echo "Wrong EFISTUB configuration; exit"
		  return 0
	      fi
	  else
	      echo "No ESP mount point configured; exit"
	      return 0
	  fi
      else
	  echo "Wrong BOOTMODE configured; exit"
	  return 0
      fi
  else
      echo "NO BOOTMODE configured; exit"
      return 0
  fi
  
  add_binary /usr/bin/sha512sum
  add_file /etc/default/chkcryptoboot.conf /etc/chkcryptoboot

  add_runscript
  
}

help ()
{
    cat<<HELPEOF
This hook create hashes of the bootloader code, and tries to warn the user
not to type it's root luks password in case of a compromised boot loader.
HELPEOF
}
