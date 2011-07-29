# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# vim:syntax=sh
pkgname=python-gflags
pkgver=1.6
pkgrel=1
pkgdesc="Commandline flags module for Python"
arch=('any')
url="http://code.google.com/p/python-gflags"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2727d3a1c9d7a3b28c64550d6c653fcf66fa6927023edcec3b58dcbeab50185f')

build() {
	cd ${pkgname}-${pkgver}
	python2 setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python2 setup.py install --root=${pkgdir}
	chmod +r ${pkgdir}/* -R
	#install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
	install -Dm644 AUTHORS ${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS
	install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
