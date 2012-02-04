# Maintainer: Pavel <otchertsov@gmail.com>

pkgname=pidgin-mono-icons-dark
pkgver=0.3
pkgrel=1
pkgdesc="Pidgin monochrome tray icons for dark panels"
arch=('any')
url="http://gnome-look.org/content/show.php/Pidgin+Tray+Icons+(Mono-Dark+Redux)?content=132576"
license=('GPL')
conflicts=('pidgin-mono-icons-light')
depends=('pidgin')
source=(${pkgname}.tar.bz2)
md5sums=('80e6f97b2e7c30973bd823911be2f22e')

build() {
  mkdir -p ${pkgdir}/usr/share/pixmaps/pidgin/tray
  cp -rf ${srcdir}/* ${pkgdir}/usr/share/pixmaps/pidgin/tray
}
