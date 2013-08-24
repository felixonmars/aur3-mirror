# Maintainer: hbdee <hbdee.arch@gmail.com>

pkgname=ksplash-lightning
pkgver=1.0
pkgrel=1
pkgdesc="Animated lightning splash screen for KDE Plasma Workspaces."
arch=('any')
url="http://kde-look.org/content/show.php/Lightning?content=160415"
license=('GPL')
depends=('kdebase-workspace')
source=("http://kde-look.org/CONTENT/content-files/160415-lightning.tar.gz")
md5sums=('5ca67324bc325e0c486a537bcb8eab27')

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/apps/ksplash/Themes
  cp -r Lightning ${pkgdir}/usr/share/apps/ksplash/Themes
  chmod 644 ${pkgdir}/usr/share/apps/ksplash/Themes/Lightning/letter/*.png
}
