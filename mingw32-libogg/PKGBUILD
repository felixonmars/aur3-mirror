# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Anders Bergh <anders@fgsfd.se>
# Contributor: Pierre Bourdon <delroth@gmail.com>
# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

_target=i486-mingw32
pkgname=mingw32-libogg
pkgver=1.3.1
pkgrel=1
pkgdesc="Ogg bitstream and framing library"
arch=(any)
url="http://xiph.org"
license=('BSD')
makedepends=('mingw32-gcc' 'mingw32-binutils' 'mingw32-w32api')
options=('!libtool' '!strip' '!buildflags')
source=(http://downloads.xiph.org/releases/ogg/libogg-${pkgver}.tar.gz)
md5sums=('ba526cd8f4403a5d351a9efaa8608fbc')

build() {
  cd "$srcdir/libogg-$pkgver"

  unset LDFLAGS
  ./configure --enable-shared --enable-static --prefix=/usr/${_target} --build=$CHOST --host=${_target}
  make
}

package() {
  cd "$srcdir/libogg-$pkgver"

  make DESTDIR="$pkgdir" install
  rm -r $pkgdir/usr/i486-mingw32/share/doc
}
