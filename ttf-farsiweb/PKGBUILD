# Maintainer: Hassan Zamani <hsn.zmani gmail com>

pkgname=ttf-farsiweb
pkgver=0.4
pkgrel=2
pkgdesc="The first set of standard Unicode Persian fonts ever published."
arch=('any')
url="http://www.farsiweb.ir/"
license=('GPL')
depends=('fontconfig' 'xorg-fonts-encodings')
install=ttf-farsiweb.install
source=(http://persian-computing.org/download/farsifonts-${pkgver}.zip)
md5sums=('65a78975c923fd9db7b9441c32559c1b')

package() {
  cd "${srcdir}/farsifonts-${pkgver}"

  install -m755 -d "${pkgdir}/usr/share/fonts/truetype/${pkgname}/"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/truetype/${pkgname}/" || return 1
}
