# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname="python2-neutronclient-deb"
pkgver=2.3.4
pkgrel=1
pkgdesc="Client library for Openstack"
arch=("i686" "x86_64")
url="http://docs.openstack.org/developer/python-neutronclient/"
license=("Apache")

depends=(
  "python2"
  "python2-pbr"
  "python2-cliff" # update
  "python2-httplib2"
  "python2-iso8601"
  "python2-simplejson"
  "python2-six"
  "python2-babel"
)

makedepends=("python2-setuptools")
conflicts=("python2-neutronclient" "python2-neutronclient-git")
source=("http://archive.ubuntu.com/ubuntu/pool/main/p/python-neutronclient/python-neutronclient_${pkgver}.orig.tar.gz")
md5sums=("90074e5498087d1ab8464294fc68eb80")

build() {
  cd "${srcdir}/python-neutronclient-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/python-neutronclient-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
