# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname="horizon-deb"
pkgver=2014.1
pkgrel=1
pkgdesc="Openstack dashboard"
arch=("i686" "x86_64")
url="http://docs.openstack.org/developer/horizon/"
license=("Apache")
groups=("openstack-deb")

depends=(
  "python2"
  "python2-django"
  "python2-django-compressor"
  "python2-django-openstack-auth"
  "python2-eventlet"
  "python2-iso8601"
  "python2-kombu"
  "python2-lockfile"
  "python2-netaddr"
  "python2-troveclient-deb"
  "python2-ceilometerclient"
  "python2-heatclient"
  "python2-lesscpy"
  "python2-pbr"
  "python2-pytz"
  "python2-six"
  "python2-mox"
  "python2-selenium"
  "nodejs"
)

makedepends=("python2-setuptools")

conflicts=(
  "horizon",
  "openstack-horizon-git"
)

source=("http://archive.ubuntu.com/ubuntu/pool/main/h/horizon/horizon_${pkgver}.orig.tar.gz")
md5sums=("e3ed8556c5d5689108d6a8f432af1118")

build() {
  cd "${srcdir}/horizon-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/horizon-${pkgver}/"
  mkdir "${pkgdir}/usr/"
  mkdir "${pkgdir}/usr/share/"
  cp -a "./build/lib" "${pkgdir}/usr/share/openstack-dashboard"
}