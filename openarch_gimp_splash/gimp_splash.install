#!/bin/bash

post_install()
{
echo "Backup old GIMP splash-image and logo"
install -D -m644 /usr/share/gimp/2.0/images/gimp-splash.png /usr/share/gimp/2.0/images/gimp-splash.png_bak
install -D -m644 /usr/share/gimp/2.0/images/gimp-logo.png /usr/share/gimp/2.0/images/gimp-logo.png_bak
install -D -m644 /usr/share/gimp/2.0/images/wilber.png /usr/share/gimp/2.0/images/wilber.png_bak
echo "Install new GIMP splash-image and logo"
install -D -m644 /usr/share/gimp/2.0/images/gimp-splash.png_new /usr/share/gimp/2.0/images/gimp-splash.png
install -D -m644 /usr/share/gimp/2.0/images/gimp-logo.png_new /usr/share/gimp/2.0/images/gimp-logo.png
install -D -m644 /usr/share/gimp/2.0/images/gimp-logo.png_new /usr/share/gimp/2.0/images/wilber.png
}
post_upgrade()
{
echo "Upgrading GIMP splash-image and logo"
install -D -m644 /usr/share/gimp/2.0/images/gimp-splash.png_new /usr/share/gimp/2.0/images/gimp-splash.png
install -D -m644 /usr/share/gimp/2.0/images/gimp-logo.png_new /usr/share/gimp/2.0/images/gimp-logo.png
install -D -m644 /usr/share/gimp/2.0/images/gimp-logo.png_new /usr/share/gimp/2.0/images/wilber.png
}
post_remove()
{
echo "Restore old GIMP splash-image and logo"
mv /usr/share/gimp/2.0/images/gimp-splash.png_bak /usr/share/gimp/2.0/images/gimp-splash.png
mv /usr/share/gimp/2.0/images/gimp-logo.png_bak /usr/share/gimp/2.0/images/gimp-logo.png
mv /usr/share/gimp/2.0/images/wilber.png_bak /usr/share/gimp/2.0/images/wilber.png
}
