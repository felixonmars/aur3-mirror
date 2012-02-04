# Maintainer: Dan Serban

pkgname=brosix
pkgver=3.x.x
pkgrel=1
pkgdesc="A secure softphone, instant messaging and collaboration tool (Skype work-alike)"
arch=(i686)
url=http://www.brosix.com/download/linux/
license=(unknown:non-free)
depends=(libjpeg6 v4l-utils zlib)
makedepends=(lynx)
_filearch="i386"

build()
{
  # --- libtiff4 ---
  rm libtiff4_*.deb 2>/dev/null || true
  _url=$(lynx -dump http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/ | grep -o http.*/libtiff4_.*${_filearch}\.deb | tail -1)
  wget ${_url}
  bsdtar -xf $(basename ${_url}) data.tar.gz
  bsdtar -xf data.tar.gz || true
  rm data.tar.gz
  install -Dm755 $(find usr/lib -type f) "${pkgdir}"/usr/lib/libtiff.so.4
  rm -r usr

  # --- brosix ---
  wget -O Brosix_free.tar.gz "http://download.brosix.com/get/?nid=1&fid=Brosix_linux"
  bsdtar -xf Brosix_free.tar.gz
  mv Brosix brosix
  chgrp -R users brosix
  chmod g+w brosix
  mkdir -p "${pkgdir}"/usr/share
  mv brosix "${pkgdir}"/usr/share/
  mkdir -p "${pkgdir}"/usr/bin
  USRBINFILE="${pkgdir}"/usr/bin/brosix
  echo '#!/bin/bash' > "${USRBINFILE}"
  echo '/usr/share/brosix/Brosix' >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
  mkdir -p "${pkgdir}"/usr/share/applications
  DESKTOPFILE="${pkgdir}"/usr/share/applications/brosix.desktop
  echo "[Desktop Entry]" > "${DESKTOPFILE}"
  echo "Name=Brosix" >> "${DESKTOPFILE}"
  echo "Comment=Brosix" >> "${DESKTOPFILE}"
  echo "Exec=brosix" >> "${DESKTOPFILE}"
  echo "Terminal=false" >> "${DESKTOPFILE}"
  echo "Type=Application" >> "${DESKTOPFILE}"
  echo "Categories=Network;Application;" >> "${DESKTOPFILE}"
}

