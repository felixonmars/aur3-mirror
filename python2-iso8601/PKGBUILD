# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: WU Jun <quark at lihdd dot net>
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>

pkgname=python2-iso8601
_libname=${pkgname/python2-/}
pkgver=0.1.10
pkgrel=1
pkgdesc="Simple module to parse ISO 8601 dates"
arch=(any)
url="http://pypi.python.org/pypi/iso8601"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)

package() {
    cd "$srcdir/$_libname-$pkgver"
    python2 setup.py install --root="$pkgdir" -O1
	install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('e712ff3a18604833f5073e836aad795b21170b19bbef70947c441ed89d0ac0e1')
