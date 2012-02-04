# Maintainer: Jacob Alexander <triplehaata@gmail.com>
pkgname=d52
pkgver=3.4.1
pkgrel=1
pkgdesc="Microcontroller disassemblers for 8052/8035/8048/8041/Z80/8080/8085"
arch=('i686' 'x86_64')
url="http://www.8052.com/users/disasm/"
license=('GPLv3')
source=("http://www.8052.com/users/disasm/${pkgname}v${pkgver//./}.zip")
md5sums=('55147203ba3bfe24ff7e7d2deec499e7')

build() {
  cd "$srcdir/${pkgname}v${pkgver//./}"
  make
}

package() {
  cd "$srcdir/${pkgname}v${pkgver//./}"

  # Binaries
  mkdir -p "${pkgdir}/usr/bin"
  cp d52 d48 dz80 "${pkgdir}/usr/bin/."

  # Docs
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp README d52manual.html dz80-d48addendum.html cyclefiles/cycle_counting.htm "${pkgdir}/usr/share/doc/${pkgname}/."
}

# vim:set ts=2 sw=2 et:

