#!/bin/bash

build ()
{
  add_checked_modules "/drivers/net/"
  add_binary "/usr/lib/initcpio/nfsmount" "/bin/nfsmount"
  add_binary "/usr/lib/initcpio/ipconfig" "/bin/ipconfig"
  add_binary "/usr/bin/tinysshd"
  add_binary "/usr/bin/tcpserver"
  add_binary "rm"
  add_binary "killall"
  add_binary "ip" "/sbin/ip"
  add_file "/lib/libnss_files.so.2"
  
  # Recommended to use umask=0027 at the very least, with keys in tmp.
  # Also to not allow normal users extracting initramfs image keys, /boot should not be readable
  # by users for example. 
  umask 0027
  TMPDIR=/tmp/.initssh
  initdir=/etc/tinyssh/init
  sshuser=tinyssh
  # check if TMPDIR exsists if not make it
  [ -d $TMPDIR ] || mkdir -p $TMPDIR

 # Create keys unless they already exist. 
 # Edit this by removing the dir, and regen it, if you wish to have new host keys for each rebuild.
 # Obviously, having a host key one knows is theoretically more secure.
 # Alternatively add finished generated keys so you can trust them, from the system itself. 
 # (don't use the SAME as on the SERVER itself though!)
  if [ -d "/etc/tinyssh/init/sshkeydir" ]; then
    echo "ssh host keys already exist! Not creating new ones."
    tinysshd-printkey /etc/tinyssh/init/sshkeydir/
  else
	tinysshd-makekey /etc/tinyssh/init/sshkeydir
	echo "Created ssh host keys in /etc/tinyssh/sshkeydir"
	tinysshd-printkey /etc/tinyssh/init/sshkeydir/
  fi
  #add_full_dir didn't recursively add all files as it claims it seems so add manually.
  add_dir $initdir/sshkeydir #"/etc/tinyssh/sshkeydir"
  add_file $initdir/sshkeydir/.ed25519.sk #"/etc/tinyssh/sshkeydir/.ed25519.sk"
  add_file /etc/tinyssh/init/sshkeydir/ed25519.pk #"/etc/tinyssh/sshkeydir/ed25519.pk" 
  add_file $initdir/sshkeydir/.nistp256ecdsa.sk #"/etc/tinyssh/sshkeydir/.ed25519.sk"
  add_file /etc/tinyssh/init/sshkeydir/nistp256ecdsa.pk #"/etc/tinyssh/sshkeydir/ed25519.pk"
  
  # change user here for randomised user names, as it is harder to guess random_name, than root/admin, etc.
  echo "$sshuser:x:0:0:$sshuser:/$sshuser:/bin/cryptsetup_shell" > "${TMPDIR}"/passwd
  mkdir -p $TMPDIR/$sshuser
  
# login shell script
  cat <<SCRIPTEOF > ${TMPDIR}/cryptsetup_shell
#!/bin/sh
if [ -c "/dev/mapper/control" ]; then
  if eval /sbin/cryptsetup luksOpen \`cat /.cryptdev\` \`cat /.cryptname\` \`cat /.cryptargs\` ; then
    echo > /.done
    killall cryptsetup
  fi
else
  echo "encryption bootup not succeeded. please wait!"
fi
SCRIPTEOF

  echo '/bin/cryptsetup_shell' > "${TMPDIR}"/shells
  chmod a+x "${TMPDIR}"/cryptsetup_shell
  add_file "${TMPDIR}/cryptsetup_shell" "/bin/cryptsetup_shell"
  add_file "${TMPDIR}/shells" "/etc/shells"
  add_dir "${TMPDIR}/$sshuser/.ssh"
  add_file "/etc/tinyssh/init/authkey" "/$sshuser/.ssh/authorized_keys"
  add_file "${TMPDIR}/passwd" "/etc/passwd"
    
  # cleanup
  rm -rf $TMPDIR/

  add_runscript
}

help ()
{
    cat<<EOF
This hook is an experimental  drop in replacement for the dropbear hook.
It allows an encrypted root device to be unlocked locally or remotely over ssh.
Users should specify IP or BOOTIF parameters and also TSP= for a custom ssh port to listen on.
This hook needs to be used in combination with, and added after the _net_ hook.

Use 'cryptdevice=device:dmname' on the kernel command line to specify an encrypted rootfs,
where 'device' is the path to the raw device and 'dmname' is the name given to
the device after unlocking.

For unlocking via keyfile, 'cryptkey=device:fstype:path' should be specified on
the kernel cmdline, where 'device' represents the raw block device where the key
exists, 'fstype' is the filesystem type of 'device' (or auto), and 'path' is
the absolute path of the keyfile within the device.

Without specifying a keyfile, you will be prompted for the password at runtime.
This means you must have a keyboard available to input it, and you may need
the keymap hook as well to ensure that the keyboard is using the layout you
expect.
EOF
}

# vim: set ft=sh ts=4 sw=4 et:
