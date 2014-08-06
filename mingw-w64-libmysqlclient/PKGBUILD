pkgname=mingw-w64-libmysqlclient
pkgver=5.6.20
pkgrel=1
pkgdesc="MySQL client libraries (mingw-w64)"
arch=(any)
url="https://www.mysql.com/products/community"
license=("GPL")
makedepends=(mingw-w64-gcc mingw-w64-tools dos2unix)
depends=(mingw-w64-crt)
conflicts=(mingw-w64-libmariadbclient)
provides=("mingw-w64-libmariadbclient=$pkgver")
options=(!strip !buildflags staticlibs)
source=("https://dev.mysql.com/get/Downloads/MySQL-${pkgver%.*}/mysql-$pkgver-win32.zip"
        "https://dev.mysql.com/get/Downloads/MySQL-${pkgver%.*}/mysql-$pkgver-winx64.zip")
md5sums=('28528dd2cecdd79d33dec1a2e1b7058c'
         '08028c89f892534114550c75f57f3453')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	find "$srcdir" -type f -exec dos2unix {} \;
}

build() {
  unset LDFLAGS
  cd "$srcdir"
  ln -s mysql-${pkgver}-win32 i686-w64-mingw32
  ln -s mysql-${pkgver}-winx64 x86_64-w64-mingw32
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_arch}/lib"
    gendef libmysql.dll
    ${_arch}-dlltool -k --input-def libmysql.def --dllname libmysql.dll --output-lib libmysql.dll.a
  done
}

package() {
  for _arch in ${_architectures} ; do
    cd "${srcdir}/${_arch}"
    mkdir -p "${pkgdir}/usr/${_arch}/"{bin,include,lib}
    cp -R include "${pkgdir}/usr/${_arch}"
    install -Dm644 lib/libmysql.dll "${pkgdir}/usr/${_arch}/bin/libmysql.dll"
    install -Dm644 lib/libmysql.dll.a "${pkgdir}/usr/${_arch}/lib/libmysql.dll.a"
    ${_arch}-ranlib "${pkgdir}/usr/${_arch}/lib/libmysql.dll.a"
    # calling strip on libmysql.dll does not work
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/"*.dll.a
  done
}
