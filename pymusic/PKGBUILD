# Maintainer: Joshua Stiefer <facedelajunk@gmail.com>
pkgname=pymusic
pkgver=0.3.7
pkgrel=1
pkgdesc="A music player with dynamic library management"
arch=('i686' 'x86_64')
url="https://launchpad.net/pymusic"
license=('GPL3')
depends=('python2' 'pygtk' 'gstreamer0.10-python' 'mutagen')
makedepends=()
provides=(pymusic)
source=(http://launchpad.net/pymusic/stable/0.3.7/+download/$pkgname-$pkgver.tar.gz)
md5sums=('2facab7e4f27b18a5f2ec5a847f88597')

package() {
  cd "$srcdir"
  sed -i "s#/usr/bin/env python#/usr/bin/env python2#" pymusic.py widgets.py
  sed -i "s/python pymusic.py/python2 pymusic.py/" pymusic
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
