# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=python-qrencode
pkgver=1.01
pkgrel=4
pkgdesc="A simple wrapper for the C qrencode library"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/qrencode"
license=(LGPL2)
depends=('python' 'qrencode')
source=("http://pypi.python.org/packages/source/q/qrencode/qrencode-${pkgver}.tar.gz")

package() {
	cd ${srcdir}/qrencode-${pkgver}
	python setup.py install --prefix=/usr --root=${pkgdir}
}

sha256sums=('fd8cdabd743e2db7a1ad332d4f0fe037e5a7807cb2f1d32da3e39439088bb610')
