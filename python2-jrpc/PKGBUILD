# Maintainer: ammon117@gmail.com

pkgname=python2-jrpc
pkgver=1.0
pkgrel=1
pkgdesc="A Python remote procedure call framework that uses JSON RPC v2.0"
url="http://alex-sherman.github.io/python-jrpc/"
license=('MIT')
arch=('any')
makedepends=(git)
source=('git://github.com/alex-sherman/python-jrpc')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd python-jrpc
	python2 setup.py build
}

package() {
	cd "$srcdir/python-jrpc"
	python2 setup.py install -O1 --skip-build --root="$pkgdir"
}

sha256sums=(SKIP)
