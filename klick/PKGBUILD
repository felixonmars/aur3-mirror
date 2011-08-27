# Contributor: Christoph Zeiler <rabyte*gmail>
# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=klick
pkgver=0.12.2
pkgrel=3
pkgdesc="An advanced command-line based metronome for JACK"
arch=('i686' 'x86_64')
url="http://das.nasophon.de/klick/"
license=('GPL')
depends=('rubberband' 'jack' 'liblo')
makedepends=('scons' 'boost')
optdepends=('liblo')
source=(http://das.nasophon.de/download/$pkgname-$pkgver.tar.gz)
md5sums=('90bc69db650c6edaa08be47df0cfe424')
build() {
  cd "${pkgname}-${pkgver}"

  scons PREFIX="/usr" RUBBERBAND="True"
}

package(){
  cd "${pkgname}-${pkgver}"

  scons DESTDIR=${pkgdir} install
}
# vim:set ts=2 sw=2 et:
