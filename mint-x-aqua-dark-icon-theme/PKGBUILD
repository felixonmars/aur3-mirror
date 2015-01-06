# Maintainer: Rob McCathie <korrode AT gmail>

pkgname=mint-x-aqua-dark-icon-theme
pkgver=1.2.3.0
pkgrel=2
pkgdesc="The Mint-X-Aqua icons with the Mint-X-Dark changes applied (dark panel optimisation)"
arch=('any')
url="http://www.linuxmint.com/"
license=('GPL3')
depends=('gtk-update-icon-cache' 'gdk-pixbuf2' 'mint-x-icons')
optdepends=("xfce-theme-adwaita-darkpanel: Suggested GTK theme when used with Xfce")
options=('!strip')
install="${pkgname}.install"
source=("http://www.paradoxcomputers.com.au/artwork/xfce-compiz/Mint-X-Aqua-Dark-${pkgver}-inheritor.tar.xz")
sha1sums=('445b0c146ffdef950d45789b40afef48a7d1edf4')

package() {
  mkdir -p "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/Mint-X-Aqua-Dark" "${pkgdir}/usr/share/icons"
}
