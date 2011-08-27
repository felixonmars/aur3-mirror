# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-cjson
_pkgname=python-cjson
pkgver=1.0.5
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Fast JSON encoder/decoder for Python"
license=('LGPL')
url="http://pypi.python.org/pypi/python-cjson"
depends=('python26')
source=("http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('4d55b66ecdf0300313af9d030d9644a3')

package() {
 cd "$srcdir/$_pkgname-$pkgver"
 python26 setup.py install --root="$pkgdir"
}
