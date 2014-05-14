# Maintainer: localizator <localizator at ukr dot net>

pkgname=nitrux-icons-kde
pkgver=3.2.7
pkgrel=1
pkgdesc="This is the KDE version of the Nitrux OS Icons."
url="http://deviantn7k1.deviantart.com/art/Nitrux-OS-Icons-for-KDE-346895844"
arch=('any')
license=('Creative Commons')
source=("NITRUX-KDE.tar.gz::http://store.nitrux.in/files/NITRUX-KDE.tar.gz")
depends=('kdebase-workspace')
options=(!strip)

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/NITRUX-KDE ${pkgdir}/usr/share/icons/
  find "${pkgdir}"/usr/share/icons -type d -exec chmod 755 '{}' \;
  find "${pkgdir}"/usr/share/icons -type f -exec chmod 644 '{}' \;
}

md5sums=('5f38d8cc83f1c9c1cfc0abfd6ac12abc')
