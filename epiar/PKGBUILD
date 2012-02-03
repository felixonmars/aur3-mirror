# Contributor: Hugo Ideler <hugoideler@dse.nl>
# Maintainer: Ronan Rabouin <darkbaboon@gmail.com>
pkgname=epiar
pkgver=0.5.0
pkgrel=3
pkgdesc="Open source space arcade & trading game"
arch=(i686 x86_64)
url="http://epiar.net"
license=('GPL')
groups=()
depends=('sdl' 'sdl_image' 'sdl_mixer' 'libxml2')
makedepends=('automake')
source=(http://epiar.net/files/$pkgname/releases/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('506ac509dd99c59875411faa4147cbb6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
