# Contributor: htmzr <htmiserr at gmail dot com>

pkgname=libvm68k
pkgver=1.0.6
pkgrel=1
pkgdesc="libvm68k is an M68000 virtual machine library written in C++"
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/libvm68k/"
license=('GPL')
depends=('gcc-libs')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://download.linuxfront.com/vx68k/libvm68k-1.0/$pkgname-$pkgver.tar.gz)
md5sums=('fe7ca60319f0e6ebf605951ec96a61dd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1

  make || return 1
  make DESTDIR=$pkgdir install || return 1

  mkdir -p $startdir/pkg/usr/share/info
  mv $startdir/pkg/usr/info/* $startdir/pkg/usr/share/info/
  rm -r $startdir/pkg/usr/info
}
