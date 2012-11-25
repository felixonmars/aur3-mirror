# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgname=sh
pkgname=python3-$_pkgname
pkgver=1.07
pkgrel=1
pkgdesc="Full-fledged subprocess interface for Python that allows you to call any program as if it were a function"
arch=('any')
url=('http://amoffat.github.com/sh/index.html')
license=("MIT")
depends=('python3')
source=(
  "http://pypi.python.org/packages/source/s/sh/$_pkgname-$pkgver.tar.gz"
)

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir"
}
md5sums=('68edad68bd108df713f1424bc65468e9')
