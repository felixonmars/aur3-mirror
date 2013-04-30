# Maintainer: Philip A Reimer <antreimer@gmail.com>

pkgname=mingw32-postgresql-libs
pkgver=9.2.4
pkgrel=2
pkgdesc="Libraries for use with PostgreSQL (mingw32)"
arch=('any')
url="http://www.postgresql.org/"
license=('custom:PostgreSQL')
depends=('mingw32-runtime'  'mingw32-openssl')
makedepends=('mingw32-gcc')
source=(http://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2)
options=('!strip' '!buildflags')
md5sums=('6ee5bb53b97da7c6ad9cb0825d3300dd')

build() {
  cd "${srcdir}/postgresql-${pkgver}"
  ./configure \
      --host=i486-mingw32 \
      --prefix=/usr/i486-mingw32 \
      --with-openssl
}

package() {
  cd "${srcdir}/postgresql-${pkgver}"

  # install libs
  for dir in src/interfaces src/bin/pg_config src/bin/psql; do
    make -C ${dir} DESTDIR="${pkgdir}" install
  done
  mv "$pkgdir/usr/i486-mingw32/lib/"*.dll "$pkgdir/usr/i486-mingw32/bin/"
  find "$pkgdir/usr/i486-mingw32" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
  find "$pkgdir/usr/i486-mingw32" -name '*.dll' | xargs -rtl1 i486-mingw32-strip -x
  find "$pkgdir/usr/i486-mingw32" -name '*.a' -o -name '*.dll' | xargs -rtl1 i486-mingw32-strip -g
  rm -r "$pkgdir/usr/i486-mingw32/share"

  cd src/include

  mkdir -p "${pkgdir}"/usr/i486-mingw32/include/{libpq,postgresql/internal/libpq}

  # these headers are needed by the public headers of the interfaces
  install -m644 pg_config.h "${pkgdir}/usr/i486-mingw32/include/"
  install -m644 pg_config_os.h "${pkgdir}/usr/i486-mingw32/include/"
  install -m644 postgres_ext.h "${pkgdir}/usr/i486-mingw32/include/"
  install -m644 libpq/libpq-fs.h "${pkgdir}/usr/i486-mingw32/include/libpq/"
  install -m644 pg_config_manual.h "${pkgdir}/usr/i486-mingw32/include/"

  # these headers are needed by the not-so-public headers of the interfaces
  install -m644 c.h "${pkgdir}/usr/i486-mingw32/include/postgresql/internal/"
  install -m644 port.h "${pkgdir}/usr/i486-mingw32/include/postgresql/internal/"
  install -m644 postgres_fe.h "${pkgdir}/usr/i486-mingw32/include/postgresql/internal/"
  install -m644 libpq/pqcomm.h "${pkgdir}/usr/i486-mingw32/include/postgresql/internal/libpq/"
}
