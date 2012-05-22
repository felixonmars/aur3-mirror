# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=python-microfiber
_pkgname=microfiber
pkgver=12.04.0
pkgrel=1
pkgdesc="A fabric for a lightweight Couch."
arch=('any')
url="https://launchpad.net/microfiber/"
license=('LGPL3')
depends=('python')
makedepends=('python-sphinx')
source=("https://launchpad.net/$_pkgname/trunk/12.04/+download/$_pkgname-$pkgver.tar.gz")
md5sums=('bda797b1aa0a3a5d1bfa12a4afe07e20')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1
}
