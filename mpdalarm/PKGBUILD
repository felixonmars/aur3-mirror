# Maintainer: Rolinh <robinDOThahlingATgw-computingDOTnet>
pkgname=mpdalarm
pkgver=0.1
pkgrel=2
pkgdesc="CLI alarm clock using MPD."
arch=('any')
url="http://www.matthew.ath.cx/projects/mpdalarm/"
license=('GPL2')
depends=('mpd' 'mpc' 'bc' 'at')
makedepends=('docbook-to-man')
provides=('mpdfadeout' 'mpdfadein')
source=(http://www.matthew.ath.cx/projects/mpdalarm/mpdalarm-0.1.tar.gz)
md5sums=('5ce667502e7e130839a28cb095d2f706')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
