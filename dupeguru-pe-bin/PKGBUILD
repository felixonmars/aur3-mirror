# Maintainer: Yochai Gal 

pkgname=dupeguru-pe-bin
pkgver=2.x.x.latest
pkgrel=1
pkgdesc="Find duplicate pictures in your picture library"
arch=(i686 x86_64)
url=http://www.hardcoded.net/dupeguru_me/
license=(custom:Fairware)
depends=(python pyqt sip)
makedepends=(lynx)
_filearch=i386
[ "${CARCH}" == "x86_64" ] && _filearch=amd64

build()
{
  rm dupeguru-pe_*.deb 2>/dev/null || true
  _url=$(lynx -dump http://www.hardcoded.net/dupeguru_pe/ | grep -o http.*${_filearch}.deb | sort | tail -1)
  wget ${_url}
  bsdtar -xf $(basename ${_url}) data.tar.gz
  bsdtar -xf data.tar.gz
  rm data.tar.gz
  rm usr/share/dupeguru_pe/sip.so
  cd usr/share/dupeguru_pe
  rm -rf PyQt4
  mkdir -p "${pkgdir}"/usr/bin
  cd "${srcdir}"/usr
  mv share "${pkgdir}"/usr/
  sed -i 's|#!/usr/bin/env python3.1|#!/usr/bin/python|' "${pkgdir}"/usr/share/dupeguru_pe/run.py
  USRBINFILE="${pkgdir}"/usr/bin/dupeguru_pe
  echo "#!/bin/bash" > "$USRBINFILE"
  echo "cd /usr/share/dupeguru_pe" >> "$USRBINFILE"
  echo "exec python run.py" >> "$USRBINFILE"
  chmod +x "$USRBINFILE"
}


