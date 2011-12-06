# Maintainer: schalaalexiazeal@gmail.com

pkgname=mingw32-libxml2-static
pkgver=2.7.8
pkgrel=1
arch=(i686 x86_64)
pkgdesc="libxml2 (mingw32)"
depends=(mingw32-gettext-static mingw32-zlib-static)
makedepends=(mingw32-gcc)
license=(LGPL)
url="http://www.xmlsoft.org/"
source=(ftp://xmlsoft.org/libxml/libxml2-${pkgver}.tar.gz)
md5sums=('8127a65e8c3b08856093099b52599c86')
options=(!strip !buildflags)

build()
{
  cd $srcdir/libxml2-$pkgver
LDFLAGS=''
  ./configure --prefix=/usr/i486-mingw32 --host=i486-mingw32 --disable-nls --without-python --enable-static --disable-shared --with-threads --with-thread-alloc || return 1
#--with-minimum --without-legacy

  make || return 1
  make DESTDIR=$pkgdir install || return 1

  cd $pkgdir
  rm -rf usr/i486-mingw32/{share/{doc,gtk-doc},man}
  rm -f usr/i486-mingw32/lib/charset.alias
}
