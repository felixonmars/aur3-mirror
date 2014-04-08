# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname="python2-novaclient-deb"
pkgver=2.17.0
pkgrel=1
pkgdesc="Client library for Openstack compute"
arch=("i686" "x86_64")
url="http://docs.openstack.org/developer/python-novaclient/"
license=("Apache")

depends=(
  "python2"
  "python2-pbr"
  "python2-iso8601"
  "python2-prettytable"
  "python2-requests"
  "python2-simplejson"
  "python2-six"
  "python2-babel"
)

makedepends=("python2-setuptools")
conflicts=("python2-novaclient" "python2-novaclient-git")
source=("http://archive.ubuntu.com/ubuntu/pool/main/p/python-novaclient/python-novaclient_${pkgver}.orig.tar.gz")
md5sums=("b9f4b00a0e3b029553f1796c393490cf")

build() {
  cd "${srcdir}/python-novaclient-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/python-novaclient-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}