# Maintainer: Byron Clark <byron@theclarkfamily.name>
pkgname=('python2-filechunkio')
pkgver=1.5
pkgrel=1
pkgdesc="Represents a chunk of an OS-level file containing bytes data"
arch=('any')
url="https://bitbucket.org/fabian/filechunkio"
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/f/filechunkio/filechunkio-${pkgver}.tar.gz)
md5sums=('bdc8507116dc32c7f140ff76cfd09ecc')

build() {
  cd "${srcdir}/filechunkio-${pkgver}"

  python2 setup.py build
}

package() {
  cd "${srcdir}/filechunkio-${pkgver}"

  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
