# $Id$
# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>

pkgname=tonicpoint-viewer
pkgver=1.4
pkgrel=6
pkgdesc="Java powerpoint presentation viewer"
arch=('any')
license=('custom')
depends=('java-runtime')
url="http://crunchbanglinux.org/forums/topic/12969/tonic-point-pps-viewer/" # Official website is dead
source=(ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/tonicpoint-${pkgver}.jar tonicpoint LICENSE)
noextract=(tonicpoint-${pkgver}.jar)
md5sums=('91c4c5bbe081b0c90acc49b54046ca95'
         'ae9a950e2b8c2c55342fd181365f9430'
         '0bad070eb33492f7c28f1c69e5eab076')

build() {
  cd "${srcdir}"

  install -D -m644 tonicpoint-${pkgver}.jar "${pkgdir}/usr/share/tonicpoint/tonicpoint-${pkgver}.jar"
  install -D -m755 tonicpoint "${pkgdir}/usr/bin/tonicpoint"

  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
