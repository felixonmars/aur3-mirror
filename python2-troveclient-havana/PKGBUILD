# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-troveclient-havana"
pkgver=0.1.4
pkgrel=1
pkgdesc="Client library for Openstack DBaaS API"
arch=("i686" "x86_64")
url="http://docs.openstack.org/developer/trove/"
license=("Apache")

depends=(
  "python2"
  "python2-pbr"
  "python2-prettytable"
  "python2-requests"
  "python2-simplejson"
  "python2-babel"
  "python2-six"
)

makedepends=("python2-setuptools")
conflicts=("python2-troveclient" "python2-troveclient-git")
source=("http://archive.ubuntu.com/ubuntu/pool/main/p/python-troveclient/python-troveclient_${pkgver}.orig.tar.gz")
md5sums=('a565d8f2d8ece8d2f9aeb3d3e8dbe11c')

build() {
  cd "${srcdir}/python-troveclient-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/python-troveclient-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
