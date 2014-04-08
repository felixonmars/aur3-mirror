# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname="python2-cinderclient-deb"
pkgver=1.0.8
pkgrel=1
pkgdesc="Client library for Openstack"
arch=("i686" "x86_64")
url="http://docs.openstack.org/developer/python-cinderclient/"
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
conflicts=("python2-cinderclient" "python2-cinderclient-git")
source=("http://archive.ubuntu.com/ubuntu/pool/main/p/python-cinderclient/python-cinderclient_${pkgver}.orig.tar.gz")
md5sums=("0941a60f77cde0937fbb71fa90747fa7")

build() {
  cd "${srcdir}/python-cinderclient-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/python-cinderclient-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}