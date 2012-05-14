pkgname=mingw32-apr
pkgver=1.4.6
pkgrel=1
pkgdesc="The Apache Portable Runtime (mingw32)"
arch=('any')
url="http://apr.apache.org/"
license=('Apache')
depends=('mingw32-runtime')
makedepends=('mingw32-gcc')
options=('!strip' '!buildflags' '!libtool')
source=("http://mirror.atlanticmetro.net/apache//apr/apr-$pkgver.tar.bz2")
md5sums=('ffee70a111fd07372982b0550bbb14b7')

build() {
  cd "${srcdir}/apr-$pkgver"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32
  make
}

package() {
  cd "${srcdir}/apr-$pkgver/build"
  make DESTDIR=${pkgdir} install
  rm $pkgdir/usr/i486-mingw32/lib/*.exp
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}