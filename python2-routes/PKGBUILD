# Maintainer : SpepS <dreamspepser@yahoo.it>
# Contributor: James Bulmer <nekinie@gmail.com>

pkgname="python2-routes"
pkgver=2.0
pkgrel=2
pkgdesc="Routing recognition and generation tools"
arch=("any")
url="https://pypi.python.org/pypi/Routes"
license=("custom:BSD")

depends=(
  "python2"
  "python2-repoze.lru"
)

makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/R/Routes/Routes-${pkgver}.tar.gz")
md5sums=("b97b1b8016d663d1000a0e0b50656c54")

build() {
    cd "${srcdir}/Routes-${pkgver}/"
    python2 setup.py build
}

package() {
  cd "${srcdir}/Routes-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
