pkgname=mingw32-wxmsw2.9-static
pkgver=2.9.5
pkgrel=1
pkgdesc="Win32 implementation of wxWidgets API for GUI (mingw32, static)"
arch=(any)
url="http://wxwidgets.org"
license=("custom:wxWindows")
depends=(mingw32-runtime)
makedepends=(mingw32-gcc dos2unix)
optdepends=("mingw32-expat"
"mingw32-libjpeg-turbo"
"mingw32-libpng"
"mingw32-libtiff"
"mingw32-libunicows"
"mingw32-zlib")
conflicts=(mingw32-wxmsw-static mingw32-wxmsw mingw32-wxmsw2.9)
options=(!strip !buildflags !emptydirs)
install=wxmsw.install
source=("http://downloads.sourceforge.net/wxwindows/wxWidgets-$pkgver.tar.bz2")
md5sums=('e98c5f92805493f150656403ffef3bb0')

build() {
  cd "$srcdir/wxWidgets-$pkgver"
  unset LDFLAGS
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --with-msw \
    --with-opengl \
    --enable-static \
    --disable-shared
  make
}

package() {
  cd "$srcdir/wxWidgets-$pkgver"
  make DESTDIR="$pkgdir/" install

  msg "Get rid of stupid carriage return (^M problem) in all text files!"
  cd "$pkgdir/"
  find ./ -type f -exec dos2unix {} \;
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf "$pkgdir/usr/i486-mingw32/share/bakefile"
}
