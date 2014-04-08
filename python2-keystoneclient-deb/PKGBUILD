# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname="python2-keystoneclient-deb"
pkgver=0.7.1
pkgrel=1
pkgdesc="Client library for Openstack identity"
arch=("i686" "x86_64")
url="http://docs.openstack.org/developer/python-keystoneclient/"
license=("Apache")

depends=(
  "python2"
  "python2-pbr"
  "python2-netaddr"
  "python2-six"
  "python2-iso8601"
  "python2-oslo-config"
  "python2-babel"
  "python2-prettytable"
  "python2-requests"
)

makedepends=("python2-setuptools")
conflicts=("python2-keystoneclient" "python2-keystoneclient-git")
source=("http://archive.ubuntu.com/ubuntu/pool/main/p/python-keystoneclient/python-keystoneclient_${pkgver}.orig.tar.gz")
md5sums=("3b52576988cfec695e171c66cc4c2cad")

build() {
  cd "${srcdir}/python-keystoneclient-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/python-keystoneclient-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}