# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname=extremetuxracer-beta
pkgver=0.5
pkgrel=2
pkgdesc="Extreme Tux Racer Beta"
arch=('i686' 'x86_64')
url="http://www.extremetuxracer.com/"
license=('GPL')
depends=('tcl' 'sdl' 'sdl_mixer' 'freetype2' 'libgl' 'mesa' 'libpng12' 'gcc-libs')
conflicts=('extremetuxracer')
source=('http://downloads.sourceforge.net/extremetuxracer/extremetuxracer-0.5beta.tar.gz')
md5sums=('cacc56bb5b36e698c976872605dee6cc')

build() {
  cd "$srcdir/extreme-tuxracer-${pkgver}beta"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
