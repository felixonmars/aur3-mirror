# Maintainer: Nathaniel Case <qalthos@gmail.com>
pkgname=python2-pyrasite
pkgver=2.0
pkgrel=1
pkgdesc="Code injection and introspection of running Python processes"
arch=('i686' 'x86_64')
url="http://pyrasite.com"
license=('GPL3')
depends=('python2' 'gdb')
source=(http://pypi.python.org/packages/source/p/pyrasite/pyrasite-$pkgver.tar.gz)
md5sums=(5491f5cc080538a7d2523ba9150ffff2)

build() {
  cd $startdir/src/pyrasite-$pkgver
  python2 ./setup.py build
}

package() {
  cd $startdir/src/pyrasite-$pkgver
  python2 ./setup.py install --root=$pkgdir
  sed -i -e 's,^#!/usr/bin.*,#!/usr/bin/env python2,' $pkgdir/usr/bin/*
}
# vim:set ts=2 sw=2 et:
