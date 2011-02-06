# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=openbox-axonkolorish-theme
pkgver=20091215
pkgrel=1
pkgdesc="axonkolorish OpenBox Theme"
arch=('any')
url="http://opendesktop.org/content/show.php/axonkolorish?content=101893"
license=('GPL')
depends=('openbox')
source=(http://opendesktop.org/CONTENT/content-files/101893-axonkolorish.tar.gz)
md5sums=('ac9aa4d60773c308445f98a5dca14c48')

build() {
  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/*.obt ${pkgdir}/usr/share/themes/ || return 1
}
