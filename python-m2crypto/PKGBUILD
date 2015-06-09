# Maintainer: Johannes Zellner <johannes@nebulon.de>

pkgname=python-m2crypto
pkgver=0.22.3
pkgrel=1
pkgdesc="A crypto and SSL toolkit for Python"
arch=('i686' 'x86_64')
url="https://github.com/martinpaljak/M2Crypto"
license=('BSD')
depends=('python' 'openssl')
makedepends=('swig' 'python-setuptools')
source=("m2crypto-${pkgver}.tar.gz::https://github.com/martinpaljak/M2Crypto/archive/v$pkgver.tar.gz"
	"LICENSE")
md5sums=('b99418d3797b28d95b784a0a56735923'
         'b0e1f0b7d0ce8a62c18b1287b991800e')

build() {
  cd "${srcdir}/M2Crypto-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/M2Crypto-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 $srcdir/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
