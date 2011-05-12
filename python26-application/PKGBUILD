# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-application
_pkgname=python-application
pkgver=1.2.7
pkgrel=1
pkgdesc="A collection of modules useful for building python applications"
arch=('any')
url="http://www.ag-projects.com"
license=('GPL')
depends=('python26')
source=("http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('07b32e25d931c5e591278848f3fc9f20')

package() {
 cd "$srcdir/$_pkgname-$pkgver"
 python26 setup.py install --root="$pkgdir"
}
