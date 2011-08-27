# Contributor: wido <widomaker2k7@gmail.com>

pkgname=gtk2-theme-ledje
pkgver=1
pkgrel=1
pkgdesc="Ledje theme by CKDevelop."
arch=('any')
url="http://crunchbanglinux-fr.org/forum/viewtopic.php?id=873"
license=('GPL3')
groups=('gtk2-themes')
depends=('gtk-engine-murrine' 'gtk-engines')
source=("http://www.ckdevelop.org/upload/ledje_theme_tar.bz2")
md5sums=('e11c61666f3d5fae733955cd75849ca3')

build() {
    # Normal
  cd ${srcdir}/Ledje
  install -d ${pkgdir}/usr/share/themes/
  cp -rf "$srcdir/Ledje/" ${pkgdir}/usr/share/themes/
  rm -r ${pkgdir}/usr/share/themes/Ledje/openbox-3/
    # Dark
  cd ${srcdir}/Ledje-dark
  cp -rf "$srcdir/Ledje-dark/" ${pkgdir}/usr/share/themes/
}
