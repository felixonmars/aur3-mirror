# Maintainer: Dan Serban
# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=gsharkdown-lite
pkgver=0.3.5
pkgrel=1
pkgdesc="Very nice app for downloading and playing music from grooveshark.com (patched to remove pylast dependency)"
arch=(any)
url="https://bitbucket.org/vkolev/gsharkdown"
license=(GPLv3)
depends=(gnome-icon-theme gstreamer0.10-python python-configobj python-notify)
conflicts=(gsharkdown)
install=gsharkdown-lite.install
source=("https://bitbucket.org/vkolev/gsharkdown/get/gsharkdown-${pkgver}.tar.bz2")
md5sums=('6540f4f11ba88a00b6ad3e8e348d7b21')

build()
{
  cd vkolev*
  sed -i 's/^    import pylast/    pass/' gsharkdown.py
  install -Dm644 data/gsharkdown_64.png "${pkgdir}"/usr/share/pixmaps/gsharkdown.png
  mkdir -p "${pkgdir}"/usr/share/gsharkdown
  mv * "${pkgdir}"/usr/share/gsharkdown/
  mkdir -p "${pkgdir}"/usr/bin
  USRBINFILE="${pkgdir}"/usr/bin/gsharkdown
  echo '#!/bin/bash' > "${USRBINFILE}"
  echo 'python2 /usr/share/gsharkdown/gsharkdown.py' >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
  mkdir -p "${pkgdir}"/usr/share/applications
  DESKTOPFILE="${pkgdir}"/usr/share/applications/gsharkdown.desktop
  echo "[Desktop Entry]" > "${DESKTOPFILE}"
  echo "Name=gSharkDown" >> "${DESKTOPFILE}"
  echo "GenericName=Download and play music from grooveshark.com" >> "${DESKTOPFILE}"
  echo "Comment=Download and play music from grooveshark.com" >> "${DESKTOPFILE}"
  echo "Exec=gsharkdown" >> "${DESKTOPFILE}"
  echo "Icon=gsharkdown" >> "${DESKTOPFILE}"
  echo "Terminal=false" >> "${DESKTOPFILE}"
  echo "Type=Application" >> "${DESKTOPFILE}"
  echo "Categories=AudioVideo;Application;" >> "${DESKTOPFILE}"
}

