# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=python2-belier
pkgver=1.2
pkgrel=1
pkgdesc="SSH connection script generator."
arch=('any')
url="http://www.ohmytux.com/belier/index.html"
license=('GPL')
depends=('python2' 'expect')
makedepends=('python2-distribute')
source=(http://www.ohmytux.com/belier/belier-$pkgver.tar.gz)
md5sums=('91b4417f26eec767d2e1c7507d27f8c3')

build() {
  cd "$srcdir/belier-$pkgver"
  sed -i -e 's|/usr/bin/env python|/usr/bin/env python2|' bel
  python2 setup.py build
}

package() {
  cd "$srcdir/belier-$pkgver"

  python2 setup.py install --root=$pkgdir -O1
}

# vim:set ts=2 sw=2 et:
