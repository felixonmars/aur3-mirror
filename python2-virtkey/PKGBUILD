# Maintainer: 
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: codl <codl@aquageek.net>
# Contributor: Megamixman <Megamixman@gmail.com>

_pkgbase=virtkey
pkgname=python2-virtkey
pkgdesc="Python 2 extension for emulating keypresses and getting layout information from the X server"
pkgver=0.63.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://launchpad.net/virtkey"
license=('LGPL')
depends=('python2' 'libxtst' 'libxkbfile' 'gtk2')
source=(http://launchpad.net/$_pkgbase/${pkgver%.*}/$pkgver/+download/$_pkgbase-$pkgver.tar.gz)
md5sums=('c1569fbb143692aafba00758041fad98')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
