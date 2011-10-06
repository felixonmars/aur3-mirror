#!/bin/bash

post_install()
{
echo "Backup old LibreOffice splash image and about image"
install -Dm644 /usr/lib/libreoffice/program/intro.png /usr/lib/libreoffice/program/intro.png_bak
#install -Dm644 /usr/lib/libreoffice/program/about.png /usr/lib/libreoffice/program/about.png_bak
install -Dm644 /etc/libreoffice/sofficerc /etc/libreoffice/sofficerc_bak
echo "Install new LibreOffice splash image"
install -Dm644 /usr/lib/libreoffice/program/intro.png_new /usr/lib/libreoffice/program/intro.png
#install -Dm644 /usr/lib/libreoffice/program/about.png_new /usr/lib/libreoffice/program/about.png
install -Dm644 /etc/libreoffice/sofficerc_new /etc/libreoffice/sofficerc
}
post_upgrade()
{
echo "Upgrade LibreOffice splash image and about image"
install -D -m644 /usr/lib/libreoffice/program/intro.png_new /usr/lib/libreoffice/program/intro.png
#install -D -m644 /usr/lib/libreoffice/program/about.png_new /usr/lib/libreoffice/program/about.png
install -Dm644 /etc/libreoffice/sofficerc_new /etc/libreoffice/sofficerc
}
post_remove()
{
echo "Restore old LibreOffice splash image and about image"
mv /usr/lib/libreoffice/program/intro.png_bak /usr/lib/libreoffice/program/intro.png
#mv /usr/lib/libreoffice/program/about.png_bak /usr/lib/libreoffice/program/about.png
mv /etc/libreoffice/sofficerc_bak /etc/libreoffice/sofficerc
}
