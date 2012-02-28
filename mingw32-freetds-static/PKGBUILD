pkgname=mingw32-freetds-static
pkgver=0.91.dev.20120114
pkgrel=1
pkgdesc="Library for accessing Sybase and MS SQL Server databases"
url="http://www.freetds.org"
arch=(any)
license=("LGPL")
depends=(mingw32-libiconv-static)
conflicts=(mingw32-freetds)
provides=(mingw32-freetds)
options=(!strip !buildflags !libtool)
backup=(usr/i486-mingw32/etc/freetds.conf
usr/i486-mingw32/etc/locales.conf
usr/i486-mingw32/etc/pool.conf)
source=(ftp://ftp.ibiblio.org/pub/Linux/ALPHA/freetds/stable/freetds-patched.tgz)
md5sums=('7f158f3b0181cb3bad15f19ad2df9faf')

build() {
  cd $startdir/src/freetds-$pkgver
  ./configure --prefix=/usr/i486-mingw32 --host=i486-mingw32 --enable-sybase-compat --enable-static --disable-shared --with-tdsver=8.0 --enable-threadsafe --disable-debug --enable-msdblib
  make || return 1
}

package() {
  cd $srcdir/freetds-$pkgver
  make DESTDIR=$startdir/pkg install
  rm -R $pkgdir/usr/i486-mingw32/share
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
