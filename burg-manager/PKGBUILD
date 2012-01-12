# Contributor: cruznick <cruznick@archlinux.us>
# Contributor: fsckd <fsckdaemon -at- gmail>

pkgname=burg-manager
pkgver=1.1.0
pkgrel=2
pkgdesc="Graphical manager for Burg bootloader"
arch=('i686' 'x86_64')
url="http://www.sourceslist.eu/burg-manager/"
license=('GPL')
install="${pkgname}.install"
depends=('buc' 'zenity' 'xorg-xrandr')
source=("http://ompldr.org/vYzgzeQ/arch-burg-manager-1.1.0.tar.gz")
sha256sums=('afd2c482bed481d534dfeeb3e09eced16076ae8181e0752158971534246a6eb3')

package() {
   cp -Rv "${srcdir}/arch-${pkgname}-${pkgver}"/* "${pkgdir}/"
   mkdir -p "${pkgdir}/etc/burg-manager"
}
