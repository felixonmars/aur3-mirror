# Maintainer: Pierre Schiltz <mysti57155@gmail.com>
pkgname=cinnamon-theme-delorean-dark
pkgver=1.55
pkgrel=1
pkgdesc="DeLorean-Dark theme for cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/123"
license=('unknown')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/themes/U5ET-89UZ-AHSP.zip')
md5sums=('17804c3fe9c94694698a15444f1e0330')

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/delorean-dark/ ${pkgdir}/usr/share/themes/
}

