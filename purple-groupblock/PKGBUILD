# Contributor: Enrique Tebari Barragan Corte <tebari@gmail.com>
pkgname=purple-groupblock
pkgver=1.0.1
pkgrel=1
pkgdesc="A libpurple (Pidgin) plugin that blocks and unblocks all buddies in a group." 
arch=('i686' 'x86_64')
url="http://www.tebari.com/purple-groupblock/"
license=('GPL')
depends=('pidgin')
makedepends=('pkgconfig')
source=(http://www.tebari.com/purple-groupblock/files/$pkgname-$pkgver.tar.gz)
md5sums=('f3bbddb41ed079ade3d8517cc0c2c103')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  install -D groupblock.so $startdir/pkg/usr/lib/purple-2/groupblock.so
}
