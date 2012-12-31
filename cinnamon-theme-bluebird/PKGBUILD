# Maintainer: Pierre Schiltz <mysti57155@gmail.com>
pkgname=cinnamon-theme-bluebird
pkgver=1.2
pkgrel=1
pkgdesc="Bluebird theme for cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/126"
license=('unknown')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/themes/7QML-645H-2XYP.zip')
md5sums=('0790b271fc0ed5325081d4763c5cfbf9')

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/Bluebird-Cinnamon ${pkgdir}/usr/share/themes/
}

