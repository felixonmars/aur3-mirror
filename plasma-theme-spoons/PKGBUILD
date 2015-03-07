# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Tobias-Adrian Stibenz <info@lavalab.org>

pkgname=plasma-theme-spoons
pkgver=0.2
pkgrel=2
pkgdesc="Spoons plasmatheme for KDE 4.1"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php/Spoons?content=77690"
depends=('kdelibs' 'kdebase-workspace')
source=("${pkgname}-${pkgver}.tar.gz::http://kde-look.org/CONTENT/content-files/77690-spoons-0.2.tar.gz"
        "LICENSE::https://www.gnu.org/licenses/gpl.txt")
sha256sums=('ee423cfed28d0a862809c99d008fcdef508048e671755851ce9b578d5ed11828'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
install=${pkgname}.install

package() {
 install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
 install -dm755 ${pkgdir}/usr/share/apps/desktoptheme
 cp -r ${srcdir}/spoons ${pkgdir}/usr/share/apps/desktoptheme
 find "${pkgdir}/usr/share/apps/desktoptheme" -type d -exec chmod 755 '{}' \;
 find "${pkgdir}/usr/share/apps/desktoptheme" -type f -exec chmod 644 '{}' \;
}
