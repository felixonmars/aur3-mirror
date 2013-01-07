# Maintainer: osily <ly50247 at 126 dot com>

pkgname=myfbterm
pkgver=6
pkgrel=1
pkgdesc="A fast terminal emulator for linux with frame buffer device or VESA video card, fix some bugs of fbterm."
arch=('i686' 'x86_64')
url="http://code.google.com/p/myfbterm/"
license=('GPL2')
depends=('gcc-libs' 'fontconfig')
provides=('fbterm')
conflicts=('fbterm')
optdepends=('libx86: for VESA video card support')
install=myfbterm.install

build() {
  svn co http://${pkgname}.googlecode.com/svn/trunk ${pkgname}
  cd "${srcdir}/${pkgname}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm644 terminfo/fbterm "${pkgdir}/usr/share/terminfo/f/fbterm"

  make DESTDIR="${pkgdir}" TERMINFO="${pkgdir}/usr/share/terminfo" install
}
