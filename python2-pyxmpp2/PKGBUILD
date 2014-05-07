# vim:set ts=2 sw=2 et:
# Maintainer: feuri <mail@feuri.de>

pkgname=python2-pyxmpp2
pkgver=2.0.0
pkgrel=1
pkgdesc="The new and shiny XMPP implementation for Python"
arch=('i686' 'x86_64')
url="http://pyxmpp.jajcus.net/"
license=('LGPL')
depends=('python2-dnspython')
makedepends=('python2-distribute')
source=(https://github.com/Jajcus/pyxmpp2/archive/$pkgver.tar.gz)
md5sums=('bc5d8d7f765724872ef5a1d6be07eda1')

build() {
  cd "$srcdir/pyxmpp2-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/pyxmpp2-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
