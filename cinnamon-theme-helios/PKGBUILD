# Maintainer: Pierre Schiltz <mysti57155@gmail.com>
pkgname=cinnamon-theme-helios
pkgver=1.4
pkgrel=1
pkgdesc="Helios theme for cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/119"
license=('unknown')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/themes/D5ZZ-LLRT-Q6EY.zip')
md5sums=('affc3cdc9e33851cec22212301f4f473')

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/Helios/Helios-Blue ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/Helios/Helios-Green ${pkgdir}/usr/share/themes/
}

