# $Id$
# Maintainer: Andreas Baumann <abaumann@yahoo.com>

_pkgbasename=libpq
pkgname=lib32-$_pkgbasename
pkgdesc="32-bit multiarch libpq Postgresql client library."
pkgver=9.1.3
pkgrel=1
arch=('x86_64')
url="http://www.postgresql.org"
license=('custom:PostgreSQL')
depends=('lib32-gcc-libs')
makedepends=('gcc-multilib' 'lib32-libxml2' 'lib32-openssl' 'python2' 'perl')
options=('!libtool')
source=(ftp://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2)
md5sums=('80390514d568a7af5ab61db1cda27e29')

build() {
  cd "${srcdir}"/postgresql-${pkgver}
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  # removed python due to cross-platform issues
  ./configure --prefix=/usr --libdir=/usr/lib32 \
  --mandir=/usr/share/man --with-libxml \
  --with-openssl --with-perl \
  --without-python --without-pam \
  --with-system-tzdata=/usr/share/zoneinfo --enable-nls \
  --datadir=/usr/share/postgresql --enable-thread-safety

  sed -i -e '/interfaces/d' src/Makefile

  # build only libs
  for dir in src/interfaces/libpq src/bin/pg_config; do
    pushd ${dir}
    make
    popd
  done
}

package() {
  cd "${srcdir}/postgresql-${pkgver}"
  for dir in src/interfaces/libpq src/bin/pg_config; do
    pushd ${dir}
    make DESTDIR="${pkgdir}" install
    popd
  done

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
md5sums=('641e1915f7ebfdc9f138e4c55b6aec0e')
