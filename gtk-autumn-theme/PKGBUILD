# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=gtk-autumn-theme
pkgver=20091215
pkgrel=2
pkgdesc="Theme autumn for GTK2"
arch=('any')
url="http://gnome-look.org/content/show.php/autumn?content=116993"
license=('GPL')
depends=('gtk2')
source=(http://gnome-look.org/CONTENT/content-files/116993-autumn.tar.gz)
md5sums=('6ad3787b855b848733ebc6f7d49ec774')

build() {
  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/autumn ${pkgdir}/usr/share/themes/ || return 1
}
