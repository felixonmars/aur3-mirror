# Maintainer: Ivo Majic
pkgname=empathy-theme-candybars
pkgver=1.2
pkgrel=1
epoch=
pkgdesc="Candybars message style for empathy"
arch=(any)
url="http://adiumxtras.com/index.php?a=xtras&xtra_id=1385"
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=("${pkgname}.zip::http://adiumxtras.com/download/1385")
noextract=()

INSTALL_PATH='usr/share/adium/message-styles'

package() {
  cd "${pkgdir}"
  mkdir -p "${pkgdir}/$INSTALL_PATH"
  cd "${srcdir}"
  cp -r "Candybars.AdiumMessageStyle" "${pkgdir}/$INSTALL_PATH"
}

md5sums=('7536c3047a160429cf159573f825e68f')
