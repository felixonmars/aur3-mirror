# Maintainer: Pierre Schiltz <mysti57155@gmail.com>
pkgname=cinnamon-theme-tout
pkgver=1.7
pkgrel=1
pkgdesc="Tout theme for cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/127"
license=('unknown')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/themes/T9XR-7U8C-PQRV.zip')
md5sums=('570237fff8383ae7782887ff9dd5af1a')

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  chmod 777 ${srcdir}/Tout/
  chmod 777 ${srcdir}/Tout/cinnamon
  cp -r ${srcdir}/Tout/ ${pkgdir}/usr/share/themes/
}

