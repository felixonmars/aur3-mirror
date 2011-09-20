# Maintainer: Stanislav Nikitin <pztrn at pztrn dot ru>

pkgname=snapfly
pkgver=0.8
pkgrel=1
pkgdesc="Lightweight GTK+ menu written in python"
arch=('any')
url="http://code.google.com/p/snapfly/"
license=('GPL3')
depends=('pygtk' 'python2-pyinotify' 'dbus-python')
source=(http://snapfly.googlecode.com/files/snapfly-$pkgver.tar.bz2)
md5sums=('ef5df18d8c42ed7fe3ff6d892b2cc623')

build() {
  cd $srcdir/$pkgname

  # Use Python 2
  sed -i 's|#!/usr/bin/python|#!/usr/bin/env python2|' src/launcher.py

  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname

  python2 setup.py install --root=$pkgdir
}
