#!/bin/bash

# args: new-ver
post_install() {
	cat << EOT
------------------------------------------------------------
> The new Software Suspend does not use kernel parameters
> to determine the suspend partition, instead it consults
> /etc/suspend.conf when booting.
> You MUST edit this file before you update your initcpio.
> Point the "resume device" variable to your swap partition.
> You will also need to update your mkinitcpio.conf file to
> include the uresume hook. Put it somewhere after udev.
> Then rebuild your initcpio with something like:
>   mkinitcpio -p kernel26
------------------------------------------------------------
EOT
}

# args: new-ver old-ver
post_upgrade() {
	cat << EOT
------------------------------------------------------------
> To update the uresume hook, please rebuild your initcpio
> with something like: mkinitcpio -p kernel26
------------------------------------------------------------
EOT
}

# vim:set ft=sh:
