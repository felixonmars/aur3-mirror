# Maintainer: Pierre Schiltz <mysti57155@gmail.com>
pkgname=cinnamon-theme-nightfall
pkgver=1.1
pkgrel=1
pkgdesc="Nightfall theme for cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/125"
license=('unknown')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/themes/C11M-E5W8-CR47.zip')
md5sums=('07e2110ad55ee465e572cc5fc179271c')

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/nightfall/ ${pkgdir}/usr/share/themes/
}

