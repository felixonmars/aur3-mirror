# Maintainer: Cheng Ye <yecheng91@msn.com>
pkgname=empathy-theme-adium-matte
pkgver=2.2
pkgrel=1
epoch=
pkgdesc="Adium Matte message style for empathy"
arch=(any)
url="http://adiumxtras.com/index.php?a=xtras&xtra_id=4987"
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
#install=PKG-INSTALL.install
changelog=
source=("${pkgname}.zip::http://adiumxtras.com/download/4987")
noextract=()

INSTALL_PATH='usr/share/adium/message-styles'

package() {
  cd "${pkgdir}"
  mkdir -p "${pkgdir}/$INSTALL_PATH"
  cd "${srcdir}"
  cp -r "Adium Matte.AdiumMessageStyle" "${pkgdir}/$INSTALL_PATH"
}

md5sums=('fadc584ba4318bae1e08d016136ae81a')
