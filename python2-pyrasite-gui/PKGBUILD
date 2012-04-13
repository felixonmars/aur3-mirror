# Maintainer: Nathaniel Case <qalthos@gmail.com>
pkgname=python2-pyrasite-gui
pkgver=2.0beta7
pkgrel=1
pkgdesc="Code injection and introspection of running Python processes"
arch=('i686' 'x86_64')
url="http://pyrasite.com"
license=('GPL3')
depends=('python2-pyrasite' 'python2-meliae' 'python2-psutil' 'libwebkit3' 'graphviz' 'python2-gobject' 'python2-pycallgraph')
source=(http://pypi.python.org/packages/source/p/pyrasite-gui/pyrasite-gui-$pkgver.tar.gz)
md5sums=(892a459a57cbe29f3e86778e36bf7809)

build() {
  cd $startdir/src/pyrasite-gui-$pkgver
  python2 ./setup.py install --root=$pkgdir
  sed -i -e 's,^#!/usr/bin.*,#!/usr/bin/env python2,' $pkgdir/usr/bin/*
}

# vim:set ts=2 sw=2 et:
