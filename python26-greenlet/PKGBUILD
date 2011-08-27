# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-greenlet
_pkgname=greenlet
pkgver=0.3.1
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Python coroutine library"
license=('MIT')
url="http://pypi.python.org/pypi/greenlet"
depends=('python26')
source=("http://pypi.python.org/packages/source/g/$_pkgname/$_pkgname-$pkgver.tar.gz"
        'patch')
md5sums=('8d75d7f3f659e915e286e1b0fa0e1c4d'
	 'cdb93be3ec24b9ae4b18f2c60ec564db')

build() {
 cd "$startdir/src/$_pkgname-$pkgver"
 patch -p1 < "$srcdir/patch"
 python26 setup.py build
}

package() {
 cd "$startdir/src/$_pkgname-$pkgver"
 python26 setup.py install --root="$pkgdir"
}
