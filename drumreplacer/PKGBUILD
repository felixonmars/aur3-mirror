# Maintainer: Kaspar Bumke <kaspar[dot]bumke[at]gmail[dot]com>
pkgname=drumreplacer
pkgver=0.2.1
pkgrel=1
pkgdesc="Drumreplacer is a JACK-enabled tool which sends a MIDI note when an audio peak is detected."
url="http://ringbreak.dnd.utwente.nl/~mrjb/drumreplacer/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('fltk' 'jack')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=("http://ringbreak.dnd.utwente.nl/~mrjb/drumreplacer/drumreplacer_$pkgver-src.tgz")
md5sums=('5743264e7d39f07b3c4881834774319d')

build() {
  cd "${srcdir}/${pkgname}"
  sed -ie '/#include <string>/i #include <stdlib.h>' src/lib/convertlib.h
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p ${pkgdir}/usr/bin
  make INSTALLDIR="${pkgdir}/usr/bin" install
}

# vim:set ts=2 sw=2 et:
