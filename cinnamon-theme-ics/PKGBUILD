# Maintainer: Pierre Schiltz <mysti57155@gmail.com>
pkgname=cinnamon-theme-ics
pkgver=0.8.2
pkgrel=1
pkgdesc="Android ICS 4.0 theme for cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/46"
license=('unknown')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/themes/I90Q-93EW-YILT.zip')
md5sums=('7cd89b2ad2fc15d18bca6f12d74202cc')

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/ICS ${pkgdir}/usr/share/themes/
}

