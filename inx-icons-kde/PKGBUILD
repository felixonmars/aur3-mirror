# Maintainer: localizator <localizator at ukr dot net>

pkgname=inx-icons-kde
pkgver=0.5
pkgrel=1
pkgdesc="This is the KDE version of the Nitrux OS Icons."
url="http://deviantn7k1.deviantart.com/art/iNX-for-KDE-346888739"
arch=('any')
license=('Creative Commons')
source=("inx_for_kde.7z::https://localizator.googlecode.com/files/inx_for_kde.7z")
depends=('kdebase-workspace' 'nitrux-icons-kde')
makedepends=()
md5sums=('a25c3cbb81ec0335b9a708e347a652ee')
options=(!strip)

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/icons
  cp -r iNX-KDE ${pkgdir}/usr/share/icons/
  find "${pkgdir}"/usr/share/icons -type d -exec chmod 755 '{}' \;
  find "${pkgdir}"/usr/share/icons -type f -exec chmod 644 '{}' \;
}