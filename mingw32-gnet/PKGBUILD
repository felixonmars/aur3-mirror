# Contributor: Andre Klitzing <aklitzing () online () de>
pkgname=mingw32-gnet
_pkgname=gnet
pkgver=2.0.8
pkgrel=1
arch=('i686')
pkgdesc="gnet (mingw32)"
depends=('mingw32-glib2')
makedepends=('mingw32-gcc' 'mingw32-pkgconfig')
license=(LGPL)
options=(!strip)
url="http://www.gnetlibrary.org"
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/2.0/${_pkgname}-$pkgver.tar.bz2)
md5sums=('93327d2fca333d7e54ba2cf54e071165')

build()
{
  cd "$srcdir/$_pkgname-$pkgver"

cat > win32.cache << EOF
ac_cv_gnet_have_abstract_sockets=no
EOF

  export CFLAGS="$CFLAGS -mms-bitfields -mno-cygwin"

  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --build=$CHOST \
    --cache-file=win32.cache \
    || return 1

  make || return 1
  make install DESTDIR="$pkgdir" || return 1
}
