# Contributor: Joshua Redfield <twiistedkaos@gmail.com>
pkgname=gpixpod
pkgver=0.6.2
pkgrel=1
pkgdesc="pygtk app to manage you photos on your iPod"
url="http://gpixpod.sourceforge.net"
depends=('pygtk')
arch=('i686')
license=('GPL2')
source=(http://dl.sourceforge.net/sourceforge/gpixpod/gpixpod-$pkgver.tar.gz)
md5sums=('2136a65e7b72ba5f5cd7ae5ebdc2205c')

build() {
  cd $startdir/src/gpixpod-$pkgver
  sed -i 's|gpixpod.glade|/usr/lib/gpixpod/gpixpod.glade|' gpixpod.py
  sed -i 's|/usr/lib/gpixpod|/usr/lib/python2.5/site-packages|' gpixpod
  rm $startdir/src/gpixpod-$pkgver/gpixpod
  echo '#!/bin/bash' >> $startdir/src/gpixpod-$pkgver/gpixpod
  echo 'exec python2.5 /usr/lib/python2.5/site-packages/gpixpod.py "$@"' >> $startdir/src/gpixpod-$pkgver/gpixpod
  python setup.py install --root=$startdir/pkg
}
