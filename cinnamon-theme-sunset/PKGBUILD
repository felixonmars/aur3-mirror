# Maintainer: Pierre Schiltz <mysti57155@gmail.com>
pkgname=cinnamon-theme-sunset
pkgver=1.0
pkgrel=1
pkgdesc="Sunset theme for cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/133"
license=('unknown')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/themes/1OGQ-9J64-XFDR.zip')
md5sums=('0853959da1573a6c7ffcc9fa4b97577b')

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/Sunset ${pkgdir}/usr/share/themes/
}

