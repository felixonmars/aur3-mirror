# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: alucryd <alucryd at gmail dot com>

pkgname=elementary-icons-taprevival-bzr
_pkgname=elementary-taprevival-icons
pkgver=5
pkgrel=1
pkgdesc="Tap Revival Icon Theme for elementaryOS"
arch=('any')
url='https://launchpad.net/~versable/+archive/elementary-community-ppas'
license=('GPL3')
depends=('elementary-icon-theme')
makedepends=('bzr')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=('!emptydirs')
install="${pkgname%-*}.install"
source=("bzr+lp:~versable/elementary-community/elementary-taprevival-icons")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${_pkgname}

  bzr revno
}

package() {
  cd "${srcdir}"/${_pkgname}

  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve=ownership icons/tap "${pkgdir}"/usr/share/icons/tap
}

# vim: ts=2 sw=2 et:

