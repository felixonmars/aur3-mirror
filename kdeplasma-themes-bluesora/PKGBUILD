# Maintainer: hbdee <hbdee.arch@gmail.com>

pkgname=kdeplasma-themes-bluesora
pkgver=3.0.2
pkgrel=1
pkgdesc="Sky blue transparent KDE Plasma theme based on abstract art"
arch=('any')
url="http://kde-look.org/content/show.php/Blue+Sora?content=136657"
license=('GPL')
depends=('kdebase-workspace')
source=("http://kde-look.org/CONTENT/content-files/136657-blue_sora.tar.gz")
md5sums=('75fe3dd9913cf89b63169032d7cadb92')

package() {
  mkdir -p ${pkgdir}/usr/share/apps/desktoptheme/blue-sora/
  cp -rp ${srcdir}/"Blue Sora"/* ${pkgdir}/usr/share/apps/desktoptheme/blue-sora/
}
