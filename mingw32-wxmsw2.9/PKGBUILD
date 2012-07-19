# Contributor: Andre Klitzing <aklitzing () online () de>
pkgname=mingw32-wxmsw2.9
pkgver=2.9.4
pkgrel=1
pkgdesc="Win32 implementation of wxWidgets API for GUI (mingw32)"
arch=(any)
url="http://wxwidgets.org"
license=("custom:wxWindows")
depends=(mingw32-runtime)
makedepends=(mingw32-gcc hd2u)
optdepends=("mingw32-expat"
"mingw32-libjpeg-turbo"
"mingw32-libpng"
"mingw32-libtiff"
"mingw32-libunicows"
"mingw32-zlib")
conflicts=(mingw32-wxmsw-static mingw32-wxmsw mingw32-wxmsw2.9-static)
options=(!strip !buildflags !emptydirs)
install=wxmsw.install
source=("http://downloads.sourceforge.net/wxwindows/wxWidgets-$pkgver.tar.bz2")
md5sums=('f1348f740a569ce2945512d5b0e70e87')

build() {
  cd "$srcdir/wxWidgets-$pkgver"
  unset LDFLAGS
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --with-msw \
    --enable-shared
  make
}

package() {
  cd "$srcdir/wxWidgets-$pkgver"
  make DESTDIR="$pkgdir/" install

  msg "Get rid of stupid carriage return (^M problem) in all text files!"
  cd "$pkgdir/"
  find ./ -type f -exec dos2unix --d2u --skipbin {} \;
  mv $pkgdir/usr/i486-mingw32/lib/*.dll "$pkgdir/usr/i486-mingw32/bin"
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf "$pkgdir/usr/i486-mingw32/share/bakefile"
}
