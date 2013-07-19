# Maintainer: Philip A Reimer <antreimer@gmail.com>
pkgname=mingw32-libmariadbclient
pkgver=5.5.32
pkgrel=1
pkgdesc="MariaDB client libraries (mingw32)"
arch=('any')
url="http:/mariadb.org"
license=('GPL')
makedepends=('mingw32-gcc' 'wine')
depends=('mingw32-runtime')
options=('!strip' '!buildflags')
source=("http://ftp.osuosl.org/pub/mariadb/mariadb-${pkgver}/win32-packages/mariadb-${pkgver}-win32.zip"
	"http://downloads.sourceforge.net/sourceforge/mingw/mingw-utils-0.4-1-mingw32-src.tar.lzma")
md5sums=('948af48b59578d10af16dc08ee2c39f0'
	 '4f9d358f50ad66159271c431c56bb210')

build() {
  cd "${srcdir}/mingw-utils-0.4/reimp"
  unset LDFLAGS
  
  unset WINEARCH
  export WINEPREFIX=${srcdir}/wineprefix
  
  i486-mingw32-gcc -g -I . reimp.c util.c ar.c -o reimp.exe
  cd "${srcdir}/mariadb-${pkgver}-win32/lib"
  wine ${srcdir}/mingw-utils-0.4/reimp/reimp.exe -d libmysql.lib
  /usr/i486-mingw32/bin/dlltool -k --input-def libmysql.def --dllname libmysql.dll --output-lib libmysql.dll.a
}

package() {
  cd "${srcdir}/mariadb-${pkgver}-win32"
  mkdir -p "${pkgdir}"/usr/i486-mingw32/{bin,include,lib}
  cp -R include "${pkgdir}"/usr/i486-mingw32
  install -Dm644 lib/libmysql.dll "${pkgdir}"/usr/i486-mingw32/bin/libmysql.dll
  install -Dm644 lib/libmysql.dll.a "${pkgdir}"/usr/i486-mingw32/lib/libmysql.dll.a
  i486-mingw32-ranlib ${pkgdir}/usr/i486-mingw32/lib/libmysql.dll.a
  # calling strip on libmysql.dll does not work
  i486-mingw32-strip --strip-unneeded ${pkgdir}/usr/i486-mingw32/lib/*.dll.a
}