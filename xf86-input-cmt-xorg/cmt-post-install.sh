#!/bin/bash

msg_blue() {
  printf "${blue}=>${bold} $1${all_off}\n"
}

note() {
  printf "${blue}=>${yellow} NOTE:${bold} $1${all_off}\n"
}

all_off="$(tput sgr0)"
bold="${all_off}$(tput bold)"
blue="${blue}$(tput setaf 4)"
yellow="${bold}$(tput setaf 3)"

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   note "*** This script *MUST* be run as root. Prepend with sudo! ***" 1>&2
   exit 1
fi
# Check if dmidecode is installed
hash dmidecode 2>/dev/null || { note "*** This script requires that 'dmidecode' is installed. ***" 1>&2; exit 1; }

msg_blue "Running post install script..."
msg_blue "(Re)installing xf86-input-cmt configuration files for: "

# Determine model
model=`dmidecode |grep -m1 "Product Name:" | awk '{print $3}'`
msg_blue "Product Name: $model"

# Remove old conf files
rm -f /etc/X11/xorg.conf.d/20-mouse.conf
rm -f /etc/X11/xorg.conf.d/40-touchpad-cmt.conf

# Symlink to right place for Arch Linux
ln -s /usr/share/xf86-input-cmt/20-mouse.conf /etc/X11/xorg.conf.d/20-mouse.conf
ln -s /usr/share/xf86-input-cmt/40-touchpad-cmt.conf /etc/X11/xorg.conf.d/40-touchpad-cmt.conf

# Symlink model specific .conf file
case $model in
Aebl)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-aebl.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-aebl.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-aebl.conf
  ;;
Alex)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-alex.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-alex.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-alex.conf
  ;;
Butterfly)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-butterfly.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-butterfly.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-butterfly.conf
  ;;
Daisy)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-daisy.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-daisy.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-daisy.conf
  ;;
Elan)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-elan.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-elan.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-elan.conf
  ;;
Falco)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-falco.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-falco.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-falco.conf
  ;;
Kaen)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-kaen.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-kaen.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-kaen.conf
  ;;
Leon)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-leon.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-leon.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-leon.conf
  ;;
Link)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-link.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-link.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-link.conf
  ;;
Lumpy)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-lumpy.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-lumpy.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-lumpy.conf
  ;;
Mario)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-mario.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-mario.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-mario.conf
  ;;
Parrot)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-parrot.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-parrot.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-parrot.conf
  ;;
Peppy)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-peppy.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-peppy.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-peppy.conf
  ;;
Pi)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-pi.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-pi.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-pi.conf
  ;;
Pit)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-pit.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-pit.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-pit.conf
  ;;
Puppy)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-puppy.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-puppy.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-puppy.conf
  ;;
Spring)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-spring.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-spring.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-spring.conf
  ;;
Stout)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-stout.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-stout.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-stout.conf
  ;;
Wolf)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-wolf.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-wolf.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-wolf.conf
  ;;
Zgb)
  rm -f /etc/X11/xorg.conf.d/50-touchpad-cmt-zgb.conf
  ln -s /usr/share/xf86-input-cmt/50-touchpad-cmt-zgb.conf /etc/X11/xorg.conf.d/50-touchpad-cmt-zgb.conf
  ;;
*)
  note "Can't detect your device, not installing device specific configuration file"
  exit 1
  ;;
esac

note "Move any existing .conf files for use with xf86-input-synaptics"
note "out of /etc/X11/xorg.conf.d/ before rebooting.\n"
msg_blue "Finished setting up configuration files.\n"
