# Maintainer: FadeMind <fademind@gmail.com>
_name=Unity-Plasma
pkgname=plasma-theme-unity
pkgver=1.0
pkgrel=1
pkgdesc="Similar to Ubuntu's Unity 8."
arch=('any')
license=('GPL')
url="http://opendesktop.org/content/show.php?content=169162"
depends=('kdelibs' 'kdebase-workspace')
source=("${pkgname}-${pkgver}.tar.gz::http://opendesktop.org/CONTENT/content-files/169162-${_name}.tar.gz"
        'LICENSE')
sha256sums=('2724ab9aa160ca586e9ea685d3d3e71ede52096a5277d39f889e9ac115ca518b'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
install="${pkgname}.install"

package() {
 install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
 install -dm755 ${pkgdir}/usr/share/apps/desktoptheme
 cp -r ${srcdir}/${_name} ${pkgdir}/usr/share/apps/desktoptheme
 find "${pkgdir}/usr" -type d -exec chmod 755 '{}' \;
 find "${pkgdir}/usr" -type f -exec chmod 644 '{}' \;
}
