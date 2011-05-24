# Maintainer: Dan Serban

pkgname=phonerlite-via-wine
pkgver=latest
pkgrel=1
pkgdesc="User-friendly SIP softphone (stripped-down version of Phoner)"
arch=(any)
url=http://www.phonerlite.de/index_en.htm
license=(custom:freeware)
depends=(libnotify wine wine_gecko)

build()
{
  wget http://www.phoner.de/PhonerLite.zip
  mkdir phonerlite
  chmod 777 phonerlite
  cd phonerlite
  bsdtar -xvf ../PhonerLite.zip
  mv license.txt LICENSE.txt
  rm l*.txt
  cd ..
  mkdir -p "${pkgdir}"/usr/share
  mv phonerlite "${pkgdir}"/usr/share/
  mkdir -p "${pkgdir}"/usr/bin
  USRBINFILE="${pkgdir}"/usr/bin/phonerlite
  echo '#!/bin/bash' > "${USRBINFILE}"
  echo 'cd /usr/share/phonerlite' >> "${USRBINFILE}"
  echo 'notify-send "Starting PhonerLite, please wait ..."' >> "${USRBINFILE}"
  echo 'wine PhonerLite.exe' >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
  mkdir -p "${pkgdir}"/usr/share/applications
  DESKTOPFILE="${pkgdir}"/usr/share/applications/phonerlite.desktop
  echo "[Desktop Entry]" > "${DESKTOPFILE}"
  echo "Name=PhonerLite" >> "${DESKTOPFILE}"
  echo "Comment=User-friendly SIP softphone" >> "${DESKTOPFILE}"
  echo "Exec=phonerlite" >> "${DESKTOPFILE}"
  echo "Terminal=false" >> "${DESKTOPFILE}"
  echo "Type=Application" >> "${DESKTOPFILE}"
  echo "Categories=Network;Application;" >> "${DESKTOPFILE}"
}
