# Maintainer: Kevin K. <kbknapp@gmail.com>

_pkgname=docli
pkgname=${_pkgname}-bin
pkgrel=1
pkgver=0.1.0_beta2
pkgdesc="A command line utility for managing DigitalOcean infrastructure"
url="https://kbknapp.github.io/docli-rs"
provides=('docli')
arch=('x86_64')
license=('MIT')
makedepends=()
conflicts=('docli-git')
replaces=('docli-git')
backup=()
install=''
source=("http://wod.twentyfives.net/bin/${_pkgname}/${_pkgname}-${pkgver//_/-}-${CARCH}-linux.tar.gz")
sha256sums=('3450faeec6452050fb7e1b94f98b6f9bbb6b7fda9b8c2c2507c9bcafa71103af')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver//_/-}-${CARCH}-linux/"

  install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -Dm 0755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

