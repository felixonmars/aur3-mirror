#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=xorcurses
pkgver=0.2.2
pkgrel=1
pkgdesc="A curses remake for Linux of Xor by Astral Software."
arch=(i686 x86_64)
url="http://www.jwm-art.net/dark.php?p=XorCurses"
license=('GPL')
depends=('ncurses')
source=(http://www.jwm-art.net/art/archive/XorCurses-${pkgver}.tar.bz2)

build() {
  cd "${srcdir}/XorCurses-${pkgver}"

  sed 's|PREFIX=/usr/local/|PREFIX=/usr/|' -i Makefile

  make
}

package() {
  cd "${srcdir}/XorCurses-${pkgver}"

  mkdir -p "${pkgdir}/usr/bin"
  make PREFIX="${pkgdir}/usr/" install
}

md5sums=('274bcec4c29d7765a65c0db9d2715576')
