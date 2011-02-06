# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=openbox-autumn-theme
pkgver=20091215
pkgrel=1
pkgdesc="Autumn OpenBox Theme"
arch=('any')
url="http://opendesktop.org/content/show.php/autumn?content=117082"
license=('GPL')
depends=('openbox')
source=(http://opendesktop.org/CONTENT/content-files/117082-autumn.tar.gz)
md5sums=('dda689fcead56fd0b333ee2418e27467')

build() {
  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/autumn ${pkgdir}/usr/share/themes/ || return 1
}
