# Maintainer: argideli

pkgname=nitrux-icons-kde-dark
pkgver=3.2.1
pkgrel=1
pkgdesc="This is the KDE version of the Nitrux OS Icons."
url="http://deviantn7k1.deviantart.com/art/Nitrux-293634207"
arch=('any')
license=('Creative Commons')
source=("NITRUX-KDE.tar.gz::http://store.nitrux.in/files/NITRUX-KDE.tar.gz")
depends=('kdebase-workspace')
options=(!strip)
md5sums=('e7f4ae64c5ae69b989764bb6bf8b01a6')

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/NITRUX-KDE ${pkgdir}/usr/share/icons/
  find "${pkgdir}"/usr/share/icons -type d -exec chmod 755 '{}' \;
  find "${pkgdir}"/usr/share/icons -type f -exec chmod 644 '{}' \;
}

