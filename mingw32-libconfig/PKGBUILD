# maintainer: Kevin Harrison <keharriso@gmail.com>

pkgname=mingw32-libconfig
pkgver=1.4.9
pkgrel=1
arch=('any')
pkgdesc="C/C++ Configuration File Library (mingw32)"
depends=('mingw32-runtime')
makedepends=('mingw32-gcc')
license=('LGPL')
url="http://www.hyperrealm.com/libconfig/"
options=(!strip)
source=("http://www.hyperrealm.com/libconfig/libconfig-$pkgver.tar.gz")
md5sums=('b6ee0ce2b3ef844bad7cac2803a90634')

build() {
  cd "$srcdir/libconfig-$pkgver"

  unset LDFLAGS # mingw-ld chokes on --hash-style=gnu

  ./configure --build=i486-mingw32 --prefix=/usr/i486-mingw32
  #make -f scripts/makefile.mingw \
    #CC=i486-mingw32-gcc \
    #LD=i486-mingw32-ld \
    #AR=i486-mingw32-ar \
    #RANLIB=i486-mingw32-ranlib \
    #prefix=/usr/i486-mingw32 \
    #DESTDIR=$pkgdir \
    #install

  make
  make install DESTDIR=$pkgdir

  install -D -m644 COPYING.LIB "$pkgdir/usr/share/licenses/${pkgname}/COPYING.LIB"
}
