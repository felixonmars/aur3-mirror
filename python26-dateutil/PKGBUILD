# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-dateutil
_pkgname=python-dateutil
pkgver=1.5
pkgrel=1
pkgdesc="Provides powerful extensions to the standard datetime module"
arch=('any')
license=('PYTHON')
url="http://labix.org/python-dateutil"
depends=('python26')
source=("http://labix.org/download/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('35f3732db3f2cc4afdc68a8533b60a52')
makedepends=('python26-distribute')

package() {
 cd "$srcdir/$_pkgname-$pkgver"
 python26 setup.py install --root="$pkgdir"
 install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
