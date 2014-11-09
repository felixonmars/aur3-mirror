# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-dejima
pkgver=r227
pkgrel=5
pkgdesc="Japanese fonts derived from Tsukiji Mincho"
arch=('any')
url="http://code.google.com/p/dejima-fonts/"
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://dejima-fonts.googlecode.com/files/dejima-mincho-${pkgver}.ttf
        COPYING)
md5sums=('abff22806f9f8a6d5cb33ce9e81cdad7'
         '69b79b2e2b0807c231ffe1be17301c1a')

package() {
  cd ${srcdir}

  install -D -m644 dejima-mincho-${pkgver}.ttf \
    ${pkgdir}/usr/share/fonts/TTF/dejima-mincho.ttf

  install -D -m 644 COPYING \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
