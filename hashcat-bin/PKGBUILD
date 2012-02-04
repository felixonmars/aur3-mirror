# Maintainer: Your Name <youremail@domain.com>
pkgname=hashcat-bin
_pkgname=hashcat
pkgver=0.34
pkgrel=1
pkgdesc="Multithreaded cross platform hash cracker"
arch=(i686)
url="http://hashcat.net/hashcat/"
license=('proprietary: run with --eula for details')
depends=()
makedepends=()
source=(${_pkgname}-${pkgver}.rar)

build() {
  cd ${srcdir}

  unrar x ${_pkgname}-${pkgver}.rar
}

package() {
  cd ${srcdir}

  rm ${_pkgname}-${pkgver}/*.exe
  
  install -m755 -d ${pkgdir}/opt/${_pkgname}/
  install -m755 -d ${pkgdir}/opt/${_pkgname}/docs/
  install -m755 -d ${pkgdir}/opt/${_pkgname}/examples/
  install -m755 -d ${pkgdir}/opt/${_pkgname}/rules/
  install -m755 -d ${pkgdir}/opt/${_pkgname}/salts/


  cd ${_pkgname}-${pkgver}
  cp -r * ${pkgdir}/opt/${_pkgname}
  
  cd ${pkgdir}/opt/${_pkgname}
  find . -type f -exec chmod 644 '{}' +
  chmod 755 hashcat-cli.bin

}

# vim:set ts=2 sw=2 et:
sha256sums=('2ffff45f061fde7c8d145a585bbbc33ee9d27656eb8007dc4f3c3d3005d9a7a4')
