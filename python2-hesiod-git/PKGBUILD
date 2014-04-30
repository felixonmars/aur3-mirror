# Maintainer: Andres Erbsen <andreser@mit.edu>
pkgname=python2-hesiod-git
pkgver=0.2.12.r0.gd9c7769
pkgrel=1
pkgdesc="Python bindings for the Hesiod naming library"
url="https://github.com/mit-athena/python-hesiod/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python2' 'hesiod')
conflicts=('python2-pyhesiod')
provides=('python2-pyhesiod')
makedepends=('python2-setuptools' 'pyrex')
source=("$pkgname"::'git://github.com/mit-athena/python-hesiod.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr || return 1
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
