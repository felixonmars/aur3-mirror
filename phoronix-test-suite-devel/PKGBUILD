# Contributor: Jesper Henriksson>
# Jason Melton <jason.melton@gmail.com>
# Maintainer: Ben R <thebenj88 *AT* gmail *DOT* com>

pkgname=phoronix-test-suite-devel
_pkgname=phoronix-test-suite

pkgver=5.2.0
pkgrel=1
pkgdesc="The most comprehensive testing and benchmarking platform available for Linux"
arch=('any')
license=('gpl')
url="http://www.phoronix-test-suite.com/"
depends=('php')
optdepends=('php-gtk' 'php-gd')
conflicts=('phoronix-test-suite')
provides=('phoronix-test-suite')
install=${pkgname}.install
changelog=${pkgname}.changelog
source=("http://www.phoronix-test-suite.com/releases/development/${_pkgname}-${pkgver}m1.tar.gz")
sha1sums=('5d8e9199857eb25f944026cae0a5cc418eca17ad')
package() {
  cd "${srcdir}/${_pkgname}"

  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/${_pkgname}"

  sed -e "s/^export PTS_DIR=.*/export PTS_DIR=\/usr\/share\/phoronix-test-suite/g" -i phoronix-test-suite
  install -m755 "${_pkgname}" "${pkgdir}/usr/bin"

  rm -f "${pkgdir}/usr/share/${_pkgname}/pts/etc/scripts/package-build-*"
  cp -r pts-core/ "${pkgdir}/usr/share/${_pkgname}"
  chmod -R 755 "${pkgdir}/usr/share/${_pkgname}/pts-core"
}
