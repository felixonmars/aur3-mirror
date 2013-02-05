# Maintainer: Kevin Zuber <uKev@knet.eu>
pkgname=snake
pkgver=0.5.2
pkgrel=1
epoch=
pkgdesc="Who doesn't know the little game where you control a snake and and collect some points? This implementation runs smoothly even on an old 486 cpu."
arch=(i686 x86_64)
url="http://www.hs.no-ip.info//software/$pkgname.html"
license=('GPL')
groups=()
depends=(sdl 'sdl_gfx>=2.0.19' sdl_mixer sdl_image sdl_ttf)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.hs.no-ip.info/software/$pkgname-$pkgver.tar.bz2
        fix_destdir_and_rights.diff)
noextract=()
md5sums=('378ae9b72f5a46913968af3b6d265d6a'
         '99d32c116639738b46e0a243fd86472c') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -uN Makefile ../fix_destdir_and_rights.diff || return 1
  make DESTDIR="/usr"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  # no check supported by package at the moment
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
