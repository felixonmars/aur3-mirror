# Maintainer: Samsagax <samsagax@gmail.com>

pkgname=zukitwo-hybrid-theme
pkgver=20111208
pkgrel=1
pkgdesc="This theme includes 3 variants each one yielding a different color scheme to compliment several popular icon themes."
arch=('any')
url="http://gnome-look.org/content/show.php/Zukitwo+Hybrid?content=146912"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine>=0.98.1.1' 'gtk-engine-unico')
optdepends=('gnome-tweak-tool: change themes')
source=('http://gnome-look.org/CONTENT/content-files/146912-Zukitwo%20Hybrid.tar.gz')
md5sums=('078e0ac1a468a2a921958c2dd23c758d')

package() {
   mkdir -p "${pkgdir}"/usr/share/themes
   cp -Rv "${srcdir}/Zukitwo Blue" ${pkgdir}/usr/share/themes/.
   cp -Rv "${srcdir}/Zukitwo Gray" ${pkgdir}/usr/share/themes/.
   cp -Rv "${srcdir}/Zukitwo Orange" ${pkgdir}/usr/share/themes/.
   cp -Rv "${srcdir}/Zukitwo Green" ${pkgdir}/usr/share/themes/.
   cp -Rv "${srcdir}/Zukitwo Red" ${pkgdir}/usr/share/themes/.
   cp -Rv "${srcdir}/Zukitwo Hybrid" ${pkgdir}/usr/share/themes/.
}
