# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=xfwm4-theme-axiom
pkgver=1.0
pkgrel=1
pkgdesc="Inspired by the metacity theme : fresh"
arch=('any')
url=("http://xfce-look.org/content/show.php/axiom?content=90145")
license=('GPL')
conflicts=('xfce4-theme-axiom')
source=(http://xfce-look.org/CONTENT/content-files/90145-axiom.tar.gz)
sha256sums=('a47229c85830ba8d542c39e0465171a5cdc33c2f4a02c3daa5a1f30688bbd581')

build() {
  install -d "${pkgdir}/usr/share/themes"
  cp -r "${srcdir}/axiom" "${pkgdir}/usr/share/themes/"
  cp -r "${srcdir}/axiomd" "${pkgdir}/usr/share/themes/"
}
