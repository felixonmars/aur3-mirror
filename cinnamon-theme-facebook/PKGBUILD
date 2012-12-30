# Maintainer: Pierre Schiltz <mysti57155@gmail.com>
pkgname=cinnamon-theme-facebook
pkgver=1.0
pkgrel=1
pkgdesc="Facebook theme for cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/136"
license=('unknown')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/themes/GJWV-78OK-3TKR.zip')
md5sums=('64bb5a65daeb158d6cceae5f90f754b0')

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  chmod 777 ${srcdir}/Facebook/
  chmod 777 ${srcdir}/Facebook/cinnamon
  cp -r ${srcdir}/Facebook/ ${pkgdir}/usr/share/themes/
}

