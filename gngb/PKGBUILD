# Maintainer: kokakoda <kokakoda [at] gmail [dot] com>
pkgname=gngb
pkgver=20060309
pkgrel=2
pkgdesc="A Gameboy Color emulator using SDL."
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://m.peponas.free.fr/gngb/"
license=('GPL')
depends=(sdl)

source=(http://m.peponas.free.fr/gngb/download/$pkgname-$pkgver.tar.gz 
	http://m.peponas.free.fr/gngb/download/memory.c.diff)

md5sums=('1bd23295ba10bfc21046d6334a1c8e76'
         '52b686529307a556a630bd3fc1d28536')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch memory.c ${srcdir}/memory.c.diff
  ./configure --prefix=/usr --mandir=/usr/share/man
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
