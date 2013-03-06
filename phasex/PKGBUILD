# Maintainer: speps <speps at aur dot archlinux dot org>

_user=williamweston
pkgname=phasex
pkgver=0.14.97
pkgrel=1
pkgdesc="An experimental MIDI softsynth with flexible phase modulation and oscillator/LFO sources."
arch=(i686 x86_64)
url="https://github.com/$_user/$pkgname"
license=('GPL3')
depends=('lash')
conflicts=("$pkgname-dev")
install="$pkgname.install"
source=("$url/archive/$pkgver.tar.gz")
md5sums=('178c9b11eb3ecb695b1a2ec3341732cd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  aclocal && autoconf && automake && autoheader
  ./configure --prefix=/usr \
              --enable-arch=native
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et: