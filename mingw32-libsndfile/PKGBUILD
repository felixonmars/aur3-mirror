# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=mingw32-libsndfile
pkgver=1.0.25
pkgrel=1
pkgdesc="A C library for reading and writing files containing sampled sound (mingw32)"
arch=(any)
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
depends=('mingw32-flac' 'mingw32-libvorbis')
options=('!libtool' '!strip')
source=(http://www.mega-nerd.com/libsndfile/files/libsndfile-${pkgver}.tar.gz)
md5sums=('e2b7bb637e01022c7d20f95f9c3990a2')

build() {
  cd "${srcdir}/libsndfile-${pkgver}"

  unset LDFLAGS CFLAGS CXXFLAGS
  ./configure --enable-shared --enable-static --prefix=/usr/i486-mingw32 --host=i486-mingw32 --disable-sqlite --disable-test-coverage #--disable-external-libs
  make
}

package() {
  cd "${srcdir}/libsndfile-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -r $pkgdir/usr/i486-mingw32/share/doc/
  rm -r $pkgdir/usr/i486-mingw32/share/man/
}
