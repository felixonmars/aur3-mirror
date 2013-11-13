# Maintainer: Anthony Lu <luathen at gmail dot com>

pkgname=python2-pyhesiod
pkgver=0.2.10
pkgrel=2
pkgdesc="Python bindings for the Hesiod naming library"
arch=('i686' 'x86_64')
url="http://ebroder.net/code/PyHesiod"
license=('MIT')
depends=('python2' 'hesiod')
makedepends=('python2-setuptools' 'pyrex')
source=("https://pypi.python.org/packages/source/P/PyHesiod/PyHesiod-$pkgver.tar.gz")
md5sums=('204aabebe88ee8afc9efa6a9c6a69cac')

package() {
  cd "$srcdir/PyHesiod-$pkgver"
  python2 setup.py install --root="$pkgdir" --prefix=/usr || return 1
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
