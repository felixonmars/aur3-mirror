# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname="python2-pycadf"
pkgver=0.8.0
pkgrel=1
pkgdesc="CADF library"
arch=('any')
url="https://pypi.python.org/pypi/pycadf"
license=('apache')

depends=(
  "python2"
  "python2-netaddr"
  "python2-six"
  "python2-iso8601"
  "python2-oslo-config"
  "python2-babel"
  "python2-pytz"
)

makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/pycadf/pycadf-${pkgver}.tar.gz")
md5sums=('3a9f439003ed165db7e9a7ef1d360259')

build() {
  cd "${srcdir}/pycadf-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/pycadf-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
