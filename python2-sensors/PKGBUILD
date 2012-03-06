# Maintainer:Nuno Araujo <nuno.araujo@russo79.com>
_pkgname=PySensors
pkgname=python2-sensors
pkgver=0.0.2
pkgrel=1
pkgdesc="Python bindings for libsensors.so"
arch=(any)
url="http://pypi.python.org/pypi/PySensors/"
license=('GPL')
depends=(python2 lm_sensors)
source=(http://pypi.python.org/packages/source/P/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=(7786f888e59866a0b3b91ec2138b0d1f)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --prefix='/usr' --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
