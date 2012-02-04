# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=naconnect
pkgver=r85
pkgrel=1
pkgdesc="Ncurses-based ALSA MIDI sequencer connection manager (patch bay)"
arch=(i686 x86_64)
url="http://nedko.arnaudov.name/soft/naconnect/"
license=('GPL')
depends=('ncurses' 'alsa-lib')
source=($url$pkgname-$pkgver.tar.bz2)
md5sums=('2059d419d8a00ef303f7eba3b924a311')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix stddef.h include
  sed -i "s|linux/||" -i list.h

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
