# vi: set sw=2 et:
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>
# Contributor: Cheer Xiao <xiaqqaix AT gmail DOT com>
pkgname=roundup
pkgver=1.5.0
pkgrel=1
pkgdesc="Issue tracking system."
url="http://www.roundup-tracker.org"
arch=('any')
license="PSF"
depends=('python2')
source=(http://pypi.python.org/packages/source/r/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"/
}

md5sums=('964bcb0edb4f38dc08b4e78e7aff5c03')
