# Contributor: napa3um <napa3um@gmail.com>

pkgname=mingw32-wxsqlite3-static
pkgver=2.0.0.1
pkgrel=1
pkgdesc="wxWidgets wrapper for SQLite3. Static version."
arch=('i686' 'x86_64')
url="http://wxcode.sourceforge.net/components/wxsqlite3/"
license=('custom:wxWindows')
depends=('mingw32-sqlite3-static' 'mingw32-wxmsw-static')
makedepends=('mingw32-w32api' 'mingw32-gcc' 'mingw32-binutils' 'mingw32-sqlite3-static' 'mingw32-wxmsw-static')
source=(http://downloads.sourceforge.net/wxcode/wxsqlite3-${pkgver}.tar.gz)
conflicts=('mingw32-wxsqlite3')
replaces=('mingw32-wxsqlite3')
md5sums=('50d96524cd7ce53c6e189aef243f0580')

build() {
  cd ${srcdir}/wxsqlite3-${pkgver}
unset LDFLAGS
  ./configure --prefix=/usr/i486-mingw32 --with-wx-config=/usr/i486-mingw32/bin/wx-config --host=i486-mingw32 --with-sqlite3-prefix=/usr/i486-mingw32
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

