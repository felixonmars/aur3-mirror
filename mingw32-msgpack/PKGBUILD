# Contributor: Leen Jewel <leenjewel@gmail.com>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=mingw32-msgpack
pkgver=0.5.7
pkgrel=2
pkgdesc="An efficient object serialization library (mingw32)"
arch=('any')
url="http://msgpack.org/"
license=('Apache')
depends=(mingw32-runtime)
makedepends=(mingw32-gcc)
source=("http://msgpack.org/releases/cpp/msgpack-$pkgver.tar.gz")
md5sums=('705106a9378c792fe22d285dba5c142c')
options=('!strip' '!buildflags' '!libtool')

build()
{
    cd "$srcdir/msgpack-$pkgver"
    mkdir -p build && cd build
    unset LDFLAGS
    ../configure \
      --prefix=/usr/i486-mingw32 \
      --host=i486-mingw32
    make
}

package()
{
    cd "$srcdir/msgpack-$pkgver/build"
    make DESTDIR=$pkgdir install
    i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
