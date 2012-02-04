# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-dnspython
_pkgname=dnspython
pkgver=1.9.2
pkgrel=2
pkgdesc="A DNS toolkit for Python"
arch=('any')
url="http://www.dnspython.org"
license=('BSD')
depends=('python26')
source=("http://www.dnspython.org/kits/$pkgver/$_pkgname-$pkgver.tar.gz")
md5sums=('26426043e619d34b47c7c30dc0a02f1c')

package() {
 cd "$srcdir/$_pkgname-$pkgver"
 python26 setup.py install --root="$pkgdir"
 install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
