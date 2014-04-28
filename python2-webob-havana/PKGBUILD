# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-webob-havana"
pkgver=1.2.3
pkgrel=1
pkgdesc="WSGI request and response object"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/WebOb"
license=("Apache")
makedepends=("python2-setuptools")
depends=("python2")
source=("https://pypi.python.org/packages/source/W/WebOb/WebOb-${pkgver}.tar.gz")
md5sums=("11825b7074ba7043e157805e4e6e0f55")

build() {
  cd "${srcdir}/WebOb-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/WebOb-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
