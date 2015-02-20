#!/bin/bash

post_install() {
    mkdir -p /etc/tinyssh/init
    touch /etc/tinyssh/init/authkey
    chmod 600 /etc/tinyssh/init/authkey
	echo "adding adding/appending empty init/authkey in /etc/tinyssh/"

    cat<<EOF
    ==> Create your authorization Ed25519 key (ssh-keygen -t ed25519)
    or ECDSA key (ssh-keygen -t ecdsa -b 256 [not recommended]) and add
    the public key to /etc/tinyssh/init/authkey (e.g. cat ~/.ssh/id_ed25519.pub | sudo tee -a /etc/tinyssh/init/authkey ) on server.
    Note, currently only ssh keys are supported, _not_ ssh options.
    
    Use ip= or BOOTIF= boot parameters for your use case.  
    (See https://wiki.archlinux.org/index.php/Mkinitcpio#Using_net). 
    To run tinyssh on a non-standard port, use tcport=<port> on kernel commandline.   
    
    Add hooks "tinyssh_encrypt encryptssh" before _filesystems_ in the HOOKS list in "/etc/mkinitcpio.conf". 
    
    One might need to add network modules to the MODULES list as well.
    Finally rebuild the initramfs [mkinitcpio -p <preset>].
    
    Default user is tinyssh, edit sshuser in /usr/lib/initcpio/install/tinyssh
    to change it to your preference.
    
    See chacha2020@poly1305, ed25519 and similar for safer ssh client key echange.

EOF
}

post_remove() {
    cat<<EOF
    Remove tinyssh_encrypt and alternatively net from HOOKS in /etc/mkinitcpio.conf and
    rebuild the initramfs [mkinitcpio -p <preset>].

	To not leave iomportant keys around, might want to do rm -rf /etc/tinyssh/init 
EOF
	#rm -rf /etc/tinyssh/init
}

post_upgrade() {
    post_install
}

