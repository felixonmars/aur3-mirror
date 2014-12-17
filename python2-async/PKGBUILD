# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

pkgname=python2-async
pkgver=0.6.2
pkgrel=1
pkgdesc="Async aims to make writing asyncronous processing easier."
arch=('any')
url="http://pypi.python.org/pypi/async"
license=('BSD')
makedepends=('python2' 'python2-distribute')
depends=('python2')
source=("http://pypi.python.org/packages/source/a/async/async-${pkgver}.tar.gz")

md5sums=('9b06b5997de2154f3bc0273f80bcef6b')

package() {
  cd "$srcdir/async-$pkgver"
  python2 setup.py install --root="$pkgdir/" || return 1
  install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
