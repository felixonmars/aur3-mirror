pkgname=mingw32-libidn
pkgver=1.25
pkgrel=1
pkgdesc="Implementation of the Stringprep, Punycode and IDNA specifications (mingw32)"
arch=(any)
license=('GPL3, LGPL')
depends=(mingw32-runtime)
makedepends=(mingw32-gcc)
options=(!strip !buildflags !libtool)
source=("http://ftp.gnu.org/gnu/libidn/libidn-$pkgver.tar.gz")
url="http://http://www.gnu.org/software/libidn/"
md5sums=('45ffabce4b8ca87fe98fe4542668d33d')

build() {
  cd "${srcdir}/libidn-${pkgver}"
  unset LDFLAGS
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32
  make
}

package() {
  cd "${srcdir}/libidn-${pkgver}/"
  mkdir -p "$pkgdir/usr/i486-mingw32/lib"
  make DESTDIR="${pkgdir}" install
  i486-mingw32-strip "$pkgdir/usr/i486-mingw32/bin/"*.exe
  i486-mingw32-strip -x "$pkgdir/usr/i486-mingw32/bin/"*.dll
  i486-mingw32-strip -g "$pkgdir/usr/i486-mingw32/lib/"*.a
  rm "$pkgdir/usr/i486-mingw32/bin/"*.def
  rm "$pkgdir/usr/i486-mingw32/lib/Libidn.dll"
  rm -rf "$pkgdir/usr/i486-mingw32/share/"{emacs,info,man}
}
