# Maintainer: Dan Serban
# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=jubler
pkgver=4.6.1
pkgrel=1
pkgdesc="Subtitle editor for SUB and SRT files"
url=http://www.jubler.org/
license=(GPLv2)
depends=(aspell java-runtime mplayer)
arch=(any)

build()
{
  wget "http://ompldr.org/vOHdhNQ/jubler-4.6.1.tar.gz"
  mkdir -p "${pkgdir}"/usr/share
  bsdtar -C "${pkgdir}"/usr/share -xvf "jubler-4.6.1.tar.gz"
  mkdir -p "${pkgdir}"/usr/bin
  USRBINFILE="${pkgdir}"/usr/bin/jubler
  echo '#!/bin/bash' > "${USRBINFILE}"
  echo 'cd /usr/share/jubler' >> "${USRBINFILE}"
  echo 'java -jar Jubler.jar' >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
  mkdir -p "${pkgdir}"/usr/share/applications
  DESKTOPFILE="${pkgdir}"/usr/share/applications/jubler.desktop
  echo "[Desktop Entry]" > "${DESKTOPFILE}"
  echo "Name=Jubler" >> "${DESKTOPFILE}"
  echo "Comment=Subtitle editor for SUB and SRT files" >> "${DESKTOPFILE}"
  echo "Exec=jubler" >> "${DESKTOPFILE}"
  echo "Terminal=false" >> "${DESKTOPFILE}"
  echo "Type=Application" >> "${DESKTOPFILE}"
  echo "Categories=Video;" >> "${DESKTOPFILE}"
}
