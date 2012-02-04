# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=xfce4-theme-axiom
pkgver=1.0
pkgrel=2
pkgdesc="Do not use this package, use : xfwm4-theme-axiom"
arch=('any')
url=("https://aur.archlinux.org/packages.php?ID=44421")
license=('GPL')
conflicts=('xfwm4-theme-axiom')
source=(http://xfce-look.org/CONTENT/content-files/90145-axiom.tar.gz)
sha256sums=('a47229c85830ba8d542c39e0465171a5cdc33c2f4a02c3daa5a1f30688bbd581')

build() {
  install -d "${pkgdir}/usr/share/themes"
  cp -r "${srcdir}/axiom" "${pkgdir}/usr/share/themes/"
  cp -r "${srcdir}/axiomd" "${pkgdir}/usr/share/themes/"
}
