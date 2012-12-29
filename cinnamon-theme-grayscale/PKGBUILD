# Maintainer: Pierre Schiltz <mysti57155@gmail.com>
pkgname=cinnamon-theme-grayscale
pkgver=0.3
pkgrel=1
pkgdesc="GrayScale theme for cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/149"
license=('unknown')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/themes/QX8J-48H9-GGH8.zip')
md5sums=('238fde0fa2f21e708cc8e8f0c5675308')

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/GrayScale ${pkgdir}/usr/share/themes/
}

