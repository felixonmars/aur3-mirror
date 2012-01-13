#
# /etc/profile.d/gnome-ssh-askpass
#

if [ -f "/usr/lib/ssh/gnome-ssh-askpass3" ] ; then
  SSH_ASKPASS="/usr/lib/ssh/gnome-ssh-askpass3"
  export SSH_ASKPASS
fi

# /etc/profile.d/gnome-ssh-askpass ends here.
