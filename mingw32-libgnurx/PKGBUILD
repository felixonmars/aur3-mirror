
pkgname=mingw32-libgnurx
pkgver=2.5.1
pkgrel=2
arch=(any)
pkgdesc="libgnurx (mingw32)"
depends=('mingw32-runtime')
makedepends=('mingw32-gcc')
options=('!buildflags' '!strip' 'staticlibs')
license=('LGPL')
url="http://mingw.sourceforge.net/"
source=("http://download.sourceforge.net/mingw/Other/UserContributed/regex/mingw-regex-${pkgver}/mingw-libgnurx-${pkgver}-src.tar.gz"
        "mingw32-libgnurx-honor-destdir.patch")
md5sums=('35c8fed3101ca1f253e9b6b1966661f6'
         '2d87c59177adf5ec13dbcc02acc4a450')

prepare () {
  cd "${srcdir}/mingw-libgnurx-${pkgver}"
  patch -Np0 -i "$srcdir"/mingw32-libgnurx-honor-destdir.patch
}


build()
{
  cd "${srcdir}/mingw-libgnurx-${pkgver}"
  unset LDFLAGS
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32
  make
}

package()
{
  cd "${srcdir}/mingw-libgnurx-${pkgver}"
  install -d $pkgdir/usr/i486-mingw32/include
  make install DESTDIR="${pkgdir}"
  i486-mingw32-strip -x -g "${pkgdir}"/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g "${pkgdir}"/usr/i486-mingw32/lib/*.a
  rm -r "${pkgdir}"/usr/i486-mingw32/man
}
