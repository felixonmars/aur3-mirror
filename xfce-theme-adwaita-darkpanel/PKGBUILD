# Maintainer: Rob McCathie <korrode AT gmail>

pkgname=xfce-theme-adwaita-darkpanel
pkgver=3.14.2.3.1
pkgrel=2
pkgdesc="For those who want to use Gnome's standard Adwaita GTK theme on Xfce, but with a dark panel"
arch=('any')
url="http://www.gnome.org"
license=('GPL2')
depends=('gnome-themes-standard' 'gtk-engine-murrine')
optdepends=("xfce-theme-greybird: Suggested window decorations for Xfwm4 and Compiz")
options=('!strip')
source=("http://www.paradoxcomputers.com.au/artwork/xfce-compiz/Adwaita-DarkPanel-${pkgver}.tar.xz")
sha1sums=('35dbcd82dea86fdbc0d8ab0a02f6a3a27406e65a')

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  cp -r "${srcdir}/Adwaita-DarkPanel" "${pkgdir}/usr/share/themes"
}
