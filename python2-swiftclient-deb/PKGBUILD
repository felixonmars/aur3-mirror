# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname="python2-swiftclient-deb"
pkgver=2.0.3
pkgrel=1
pkgdesc="Client library for Openstack"
arch=("i686" "x86_64")
url="http://docs.openstack.org/developer/python-swiftclient/"
license=("Apache")

depends=(
  "python2"
  "python2-simplejson"
  "python2-requests"
)

makedepends=("python2-setuptools")
conflicts=("python2-swiftclient" "python2-swiftclient-git")
source=("http://archive.ubuntu.com/ubuntu/pool/main/p/python-swiftclient/python-swiftclient_${pkgver}.orig.tar.gz")
md5sums=("bac2e878baabc1d3a8ea85a615b365b6")

build() {
  cd "${srcdir}/python-swiftclient-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/python-swiftclient-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}