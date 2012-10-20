# Contributor: Tocer Deng <tocer.deng@domain.com>

pkgname=pychmviewer
pkgver=20091012
pkgrel=6
pkgdesc="similar to kchmviewer and enhanced support for Chinese"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pychmviewer/"
license=('GPL2')
depends=('python2' 'python2-pyqt' 'python2-bsddb' 'python2-pychm')
source=("http://pychmviewer.googlecode.com/files/$pkgname.tgz"
        "0001-fix-import.patch")
build() {
  cd "$srcdir/$pkgname"

  patch -p1 -i ../0001-fix-import.patch

  DESTDIR="$pkgdir/usr/share/pychmviewer/"
  mkdir -p $DESTDIR
  install -m 644 $srcdir/$pkgname/* $DESTDIR
  #chmod +x "$DESTDIR/pychmviewer.py"

  BINDIR="$pkgdir/usr/bin"
  mkdir -p $BINDIR
  echo '#!/bin/sh' > $BINDIR/pychmviewer
  echo 'python2 /usr/share/pychmviewer/pychmviewer.py "$1" ' >> $BINDIR/pychmviewer
  chmod +x "$BINDIR/pychmviewer"
}

# vim:set ts=2 sw=2 et:

md5sums=('c213af63d64b5f137f0b079488f9b394'
         '930cb2c07bd08196a6941e11530c840f')
