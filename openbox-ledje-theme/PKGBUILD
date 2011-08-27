# Contributor: wido <widomaker2k7@gmail.com>

pkgname=openbox-ledje-theme
pkgver=1
pkgrel=1
pkgdesc="Openbox Ledje theme by CKDevelop."
arch=('any')
url="http://crunchbanglinux-fr.org/forum/viewtopic.php?id=873"
license=('GPL3')
depends=('openbox')
source=("http://www.ckdevelop.org/upload/ledje_theme_tar.bz2")
md5sums=('e11c61666f3d5fae733955cd75849ca3')

build() {
  cd ${srcdir}/Ledje
  install -d ${pkgdir}/usr/share/themes/Ledje/openbox-3
  cp -rf "$srcdir/Ledje/openbox-3" ${pkgdir}/usr/share/themes/Ledje/
}
