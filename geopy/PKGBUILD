# Contributor: Richard DUMAIS <richard@nerux.org>
pkgname=geopy
pkgver=1.9.0
pkgrel=1
pkgdesc="Geocoding toolbox for Python"
arch=('i686' 'x86_64')
url='https://github.com/geopy/geopy'
license=('MIT')
depends=('python2' 'python2-distribute')
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
md5sums=('a95d77e4172eea3477bc172442c2edb3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" || return 1
}
