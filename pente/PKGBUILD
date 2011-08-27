# Maintainer: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Lukas Sabota <punkrockguy318@comcast.net>
pkgname=pente
pkgver=2.2.5
pkgrel=4
pkgdesc="A five in a row game that can be played with X, curses, or text."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.igoweb.org/~wms/comp/pente/"
depends=('ncurses' 'libx11')
makedepends=('libxt')
source=(http://www.igoweb.org/~wms/comp/pente/$pkgname-$pkgver.tar.gz)
md5sums=('af1d851f1e2e0b41c52ea2772fbd5cc0')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr || return 1
  make || return 1
  install -Dm755 pente-$CARCH-Linux $pkgdir/usr/bin/pente
  install -Dm644 man6/pente.6       $pkgdir/usr/share/man/man6/pente.6
}

# vim:set ts=2 sw=2 et:
