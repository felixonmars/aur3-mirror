# Maintainer: localizator <localizator at ukr dot net>

pkgname=inx-icon-theme
pkgver=0.6
pkgrel=1
pkgdesc="iNX is an Icon set based on the look and feel of iOS."
url="http://deviantn7k1.deviantart.com/art/iNX-Icon-set-344494902"
arch=('any')
license=('Creative Commons')
source=("inx_icon_gtk.7z::https://localizator.googlecode.com/files/inx_icon_gtk.7z")
depends=('librsvg' 'nitrux-icon-theme')
makedepends=()
md5sums=('144169c5ee705b0fd86efdebb4a37a9f')
options=(!strip)

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/icons
  cp -r iNX-GTK ${pkgdir}/usr/share/icons/
  find "${pkgdir}"/usr/share/icons -type d -exec chmod 755 '{}' \;
  find "${pkgdir}"/usr/share/icons -type f -exec chmod 644 '{}' \;
}
