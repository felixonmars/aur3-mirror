# vim:set ts=2 sw=2 et:
# Maintainer: feuri <mail@feuri.de>

pkgname=python-pyxmpp2
pkgver=2.0alpha2
pkgrel=1
pkgdesc="The new and shiny XMPP implementation for Python"
arch=('i686' 'x86_64')
url="http://pyxmpp.jajcus.net/"
license=('LGPL')
depends=('python-dnspython')
makedepends=('python-distribute')
source=(https://github.com/downloads/Jajcus/pyxmpp2/pyxmpp2-$pkgver.tar.gz)
md5sums=('2898c440e234927b47fd19576d34109a')

build() {
  cd "$srcdir/pyxmpp2-$pkgver"
  python3 setup.py build
}

package() {
  cd "$srcdir/pyxmpp2-$pkgver"
  python3 setup.py install --root="$pkgdir"
}
