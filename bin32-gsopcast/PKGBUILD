# Contributor: tri <trile7@gmail.com>
pkgname=bin32-gsopcast
pkgver=0.4.0
pkgrel=1
pkgdesc="A GTK front-end of p2p TV sopcast for 64-bit only."
arch=('x86_64')
url="http://code.google.com/p/gsopcast/"
license=('GPL') 
depends=('bin32-sopcast' 'gtk2' 'cairo' 'alsa-lib' 'intltool')
makedepends=('pkgconfig')
source=("http://gsopcast.googlecode.com/files/gsopcast-$pkgver.tar.bz2" "header.h.diff")
md5sums=('65e4f09d714455df809a58c12a76749f'
         '66c3c68233d3dfd239314922de3a575f')

build() {
  patch $srcdir/gsopcast-$pkgver/src/header.h $startdir/header.h.diff
  cd $srcdir/gsopcast-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install
}
