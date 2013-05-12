# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=mingw32-libxml2
pkgver=2.9.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="libxml2 (mingw32)"
depends=('mingw32-gettext' 'mingw32-zlib')
makedepends=('mingw32-gcc')
options=('!buildflags' '!strip')
license=('MIT')
url="http://www.xmlsoft.org/"
source=("ftp://xmlsoft.org/libxml/libxml2-${pkgver}.tar.gz")
md5sums=('9c0cfef285d5c4a5c80d00904ddab380')

build()
{
  cd "${srcdir}/libxml2-${pkgver}"

  unset LDFLAGS
  export CFLAGS="${CFLAGS} -mms-bitfields"

  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --build="${CHOST}" \
    --without-python \
    --without-threads

  make
}

package()
{
  cd "${srcdir}/libxml2-${pkgver}"

  make install DESTDIR="${pkgdir}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  rm -rf "${pkgdir}/usr/i486-mingw32"/{share/{doc,gtk-doc},man}
  rm -f "${pkgdir}/usr/i486-mingw32/lib/charset.alias"
}

# vim:set ts=2 sw=2 et:
