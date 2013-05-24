#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>
pkgname=python2-pymcu
pkgver=1.0.12
pkgrel=1
pkgdesc="Python Micro Controller Wrapper"
depends=('python2')
makedepend=('python2-distutils')
arch=('any')
url="http://pymcu.com"
license=('GPL')
source=("https://pypi.python.org/packages/source/p/pymcu/pymcu-${pkgver}.zip")
build() {
  PYTHON=python2
  cd "${srcdir}/pymcu-${pkgver}"
  $PYTHON setup.py install --root "${pkgdir}"
}
sha256sums=('a470fa5822fa57388a33691883a32680d6f50181d38f04abc604dc05e502efbe')
