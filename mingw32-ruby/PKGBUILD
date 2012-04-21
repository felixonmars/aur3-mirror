pkgname=mingw32-ruby
pkgver=1.9.3_p194
pkgrel=1
pkgdesc="An object-oriented language for quick and easy programming (mingw32)"
arch=(any)
url="http://www.ruby-lang.org/en/"
depends=(mingw32-runtime mingw32-openssl)
makedepends=(mingw32-gcc ruby)
license=('BSD' 'custom')
options=(!buildflags !strip)
source=("ftp://ftp.ruby-lang.org/pub/ruby/${pkgver%.*}/ruby-${pkgver//_/-}.tar.bz2")
md5sums=('2278eff4cfed3cbc0653bc73085caa34')

build() {
  cd "$srcdir/ruby-${pkgver//_/-}"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32
  make
}

package() {
  cd "$srcdir/ruby-${pkgver//_/-}/build"
  make DESTDIR=$pkgdir install
  
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/lib/ruby/1.9.1/i386-mingw32/*.so
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/lib/ruby/1.9.1/i386-mingw32/digest/*.so
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/lib/ruby/1.9.1/i386-mingw32/dl/*.so
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/lib/ruby/1.9.1/i386-mingw32/enc/*.so
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/lib/ruby/1.9.1/i386-mingw32/enc/trans/*.so
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/lib/ruby/1.9.1/i386-mingw32/io/*.so
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/lib/ruby/1.9.1/i386-mingw32/json/ext/*.so
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/lib/ruby/1.9.1/i386-mingw32/mathn/*.so
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/lib/ruby/1.9.1/i386-mingw32/racc/*.so
  rm -rf $pkgdir/usr/i486-mingw32/share/{doc,man}
}
