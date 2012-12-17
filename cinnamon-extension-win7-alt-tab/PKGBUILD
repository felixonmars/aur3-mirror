# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=cinnamon-extension-win7-alt-tab
pkgver=1.8
pkgrel=1
pkgdesc="A Win-7 style Alt-Tab replacement for cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/extensions/view/22"
license=('GPL2')
depends=('cinnamon')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.zip::http://cinnamon-spices.linuxmint.com/uploads/extensions/UI2L-R03O-63AN.zip)

package() {
  mkdir -p "$pkgdir"/usr/share/cinnamon/extensions
  cp -r "$srcdir"/Win7AltTab@entelechy "$pkgdir"/usr/share/cinnamon/extensions
}

sha256sums=('d94265ac9fee019ece06e435bb803a3f96848ae6a69619a534d6b64af9616aa2')
