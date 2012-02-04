# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=openbox-colorline-theme
pkgver=20100328
pkgrel=2
pkgdesc="Color Line OpenBox Theme"
arch=('any')
url="http://opendesktop.org/content/show.php/Color_Line?content=109492"
license=('GPL')
depends=('openbox' 'gtk2')
source=(http://opendesktop.org/CONTENT/content-files/109492-illumin8_crunchbang_themes.tar.gz)
md5sums=('4008db9f2eacf8af27722b1f3562f27e')

build() {
  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/illumin8_crunchbang_themes/* ${pkgdir}/usr/share/themes/
}
