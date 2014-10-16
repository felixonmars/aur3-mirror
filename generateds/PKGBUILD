# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=generateds
_pkgname=generateDS
pkgver=2.13a
pkgrel=1
pkgdesc="A generator of Python data structures and XML parser from Xschema (XSD)"
arch=('any')
url="http://www.davekuhlman.org/generateDS.html"
license=('custom:MIT')
depends=('python2-lxml')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/g/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('9da6f742aa8118e0ba95aba69e1230df')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" -O1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
