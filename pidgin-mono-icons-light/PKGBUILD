# Maintainer: Pavel <otchertsov@gmail.com>

pkgname=pidgin-mono-icons-light
pkgver=0.3
pkgrel=1
pkgdesc="Pidgin monochrome tray icons for light panels"
arch=('any')
url="http://gnome-look.org/content/show.php/Pidgin+Tray+Icons?content=119879"
license=('GPL')
depends=('pidgin')
conflicts=('pidgin-mono-icons-dark')
source=(${pkgname}.tar.bz2)
md5sums=('ed0723cec28e8be5f338db69bb33b5ac')

build() {
  mkdir -p ${pkgdir}/usr/share/pixmaps/pidgin/tray
  cp -rf ${srcdir}/* ${pkgdir}/usr/share/pixmaps/pidgin/tray
}
