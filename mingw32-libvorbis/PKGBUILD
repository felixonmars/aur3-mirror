# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=mingw32-libvorbis
pkgver=1.3.3
pkgrel=1
pkgdesc="Vorbis codec library"
arch=(any)
url="http://xiph.org"
license=('custom')
depends=('mingw32-libogg')
makedepends=('mingw32-gcc' 'mingw32-binutils' 'mingw32-w32api')
options=(!libtool !strip !buildflags)
source=(http://downloads.xiph.org/releases/vorbis/libvorbis-${pkgver}.tar.gz)
md5sums=('6b1a36f0d72332fae5130688e65efe1f')

build() {
  cd "$srcdir/libvorbis-$pkgver"

  unset LDFLAGS
  #-march=i686 optimizes too much, strip it out
  CFLAGS=${CFLAGS/-march=$CARCH} ./configure --prefix=/usr --enable-static --enable-shared --prefix=/usr/i486-mingw32 --host=i486-mingw32
  make
}

package() {
  cd "$srcdir/libvorbis-$pkgver"

  make DESTDIR="$pkgdir" install
  rm -r $pkgdir/usr/i486-mingw32/share/doc
}
