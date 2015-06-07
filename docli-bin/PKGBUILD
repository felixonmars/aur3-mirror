# Maintainer: Kevin K. <kbknapp@gmail.com>

_pkgname=docli
pkgname=${_pkgname}-bin
pkgrel=2
pkgver=0.1.0_beta
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
sha256sums=('efa5c92c8c1760a98ccd79103c2d3df5ef3bb16a2b5106eea368c50238ddf0c1')

package() {
  cd "${srcdir}/${_pkgname}/"

  install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -Dm 0755 bin/docli "${pkgdir}/usr/bin/docli"
}

