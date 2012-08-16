# Maintainer: Rax Garfield <admin at dvizho.ks.ua>

pkgname=xfwm4-theme-prelude
pkgver=20080422
pkgrel=1
pkgdesc="Minimalist, thin theme for XFWM4, uses your GTK2 colors."
arch=('any')
url="http://xfce-look.org/content/show.php?content=69300"
license=('GPL')
source=('http://xfce-look.org/CONTENT/content-files/69300-prelude-4.0.2.tar.bz2')
md5sums=('411ee2f18e5c26f0d554ce97268229bc')

build() {
  cd ${srcdir}/prelude-4.0/xfwm4

  # clean up themerc and enable layout changing
  sed -e '/#[a-z]/d' -e '/^$/d' -e '/button_layout/d' themerc | LC_COLLATE=C sort -o themerc
}

package() {
  cd ${srcdir}

  install -d -m755 ${pkgdir}/usr/share/themes
  cp -a prelude-4.0 ${pkgdir}/usr/share/themes/Prelude
  chmod -R 755 ${pkgdir}/usr/share/themes/Prelude
}
