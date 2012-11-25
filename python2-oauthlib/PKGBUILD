# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-oauthlib
pkgver=0.3.3
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="A generic, spec-compliant, thorough implementation of the OAuth request-signing logic"
arch=(any)
url="https://github.com/idangazit/oauthlib"
license=('BSD')
depends=(python2-rsa)
makedepends=(python2-distribute)
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install -O1 --root="$pkgdir"
	install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('4088ee61a499b27f4ac331938cf687dc30a3e7fe1a8acee1c4411850bbf319e9')
