# Maintainer: josephgbr <rafael.f.f1@gmail.com>
_pkgbase=lzo2
pkgname=lib32-$_pkgbase
pkgver=2.06
pkgrel=1
pkgdesc="Portable lossless data compression library (32 bit)"
arch=('x86_64')
url="http://www.oberhumer.com/opensource/lzo"
license=('GPL')
depends=('lib32-glibc' $_pkgbase)
source=(http://www.oberhumer.com/opensource/lzo/download/lzo-${pkgver}.tar.gz)
options=(!libtool)
md5sums=('95380bd4081f85ef08c5209f4107e9f8')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd lzo-${pkgver}
  ./configure --prefix=/usr --enable-shared --libdir=/usr/lib32
  make

  # build minilzo
  gcc $CFLAGS -fpic -Iinclude/lzo -o minilzo/minilzo.o -c minilzo/minilzo.c
  gcc -g -shared -o libminilzo.so.0 -Wl,-soname,libminilzo.so.0 minilzo/minilzo.o
}

package() {
  cd lzo-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}

  # install minilzo
  install -m 755 libminilzo.so.0 "${pkgdir}"/usr/lib32
  ln -s libminilzo.so.0 "${pkgdir}"/usr/lib32/libminilzo.so
}
