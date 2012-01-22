# Maintainer: Dan Serban

pkgname=dupeguru-se-bin
pkgver=3.x.x.latest
pkgrel=1
pkgdesc="Find duplicate files on your computer"
arch=(i686 x86_64)
url=http://www.hardcoded.net/dupeguru/
license=(custom:Fairware)
depends=(python pyqt sip)
makedepends=(lynx)
_filearch=i386
[ "${CARCH}" == "x86_64" ] && _filearch=amd64

build()
{
  rm dupeguru-se_*.deb 2>/dev/null || true
  _url=$(lynx -dump http://www.hardcoded.net/dupeguru/ | grep -o http.*${_filearch}.deb | sort | tail -1)
  wget ${_url}
  bsdtar -xf $(basename ${_url}) data.tar.gz
  bsdtar -xf data.tar.gz
  rm data.tar.gz
  rm usr/share/dupeguru_se/sip.so
  cd usr/share/dupeguru_se
  rm -rf PyQt4
  mkdir -p "${pkgdir}"/usr/bin
  cd "${srcdir}"/usr
  mv share "${pkgdir}"/usr/
  sed -i 's|#!/usr/bin/env python3.1|#!/usr/bin/python|' "${pkgdir}"/usr/share/dupeguru_se/run.py
  USRBINFILE="${pkgdir}"/usr/bin/dupeguru_se
  echo "#!/bin/bash" > "$USRBINFILE"
  echo "cd /usr/share/dupeguru_se" >> "$USRBINFILE"
  echo "exec python run.py" >> "$USRBINFILE"
  chmod +x "$USRBINFILE"
}

