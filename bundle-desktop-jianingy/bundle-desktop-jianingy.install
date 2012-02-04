#!/bin/bash

post_install()
{
    cp /etc/slim.conf.bundle-desktop /etc/slim.conf || exit 1
    fc-cache -rv
    echo -------------------------------
    echo "Please run /usr/share/bundle-desktop/bundel-desktop-setup.sh as normal user"
    echo "To setup your desktop"
    echo "----"
    echo The fonts in this package are free only for who have a Apple MacOSX license.
    echo By using this package you state that you own and have accepted this license.
    echo -------------------------------

}
