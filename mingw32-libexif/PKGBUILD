# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

pkgname=mingw32-libexif
_pkgname=libexif
pkgver=0.6.21
pkgrel=1
pkgdesc="A library to parse an EXIF file and read the data from those tags"
arch=(i686 x86_64)
license=('LGPL')
url="http://sourceforge.net/projects/libexif"
depends=('mingw32-gcc')
options=('!libtool')
source=(http://downloads.sf.net/sourceforge/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2)

build()
{
  unset LDFLAGS

  export CFLAGS="-O2 -pipe -D_FORTIFY_SOURCE=2"
  export CXXFLAGS="-O2 -pipe -D_FORTIFY_SOURCE=2"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr/i486-mingw32 \
		--host=i486-mingw32 \
		--build=$CHOST
  make

}

package()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  find . -name '*.a' -o -name '*.dll' -o -name '*.exe' \
      | xargs -rtl1 i486-mingw32-strip -g
}

md5sums=('27339b89850f28c8f1c237f233e05b27')
