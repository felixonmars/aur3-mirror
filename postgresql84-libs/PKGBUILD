# Maintainer:  Scott Smith <jcdenton513 gmail com>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=('postgresql84-libs')
#pkgname=('postgresql84')

# To save some compile time you can opt to uncomment the following lines
# if you're building this package using makepkg. If you're using a packager
# like clyde, I don't guarantee anything. This will build both postgresql84
# and postgresql84-libs. Remember to comment the pkgname lines above!

#pkgbase=('postgresql84')
#pkgname=('postgresql84-libs' 'postgresql84')

pkgver=8.4.8
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.postgresql.org"
license=('BSD')
makedepends=('libxml2' 'python2' 'perl')
source=("ftp://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2"
	postgresql84
	postgresql84.confd
	build.patch
	postgresql84.pam
	postgresql84.logrotate
	plperl-5.14-8.4.patch)

_pkgbase=postgresql
_pqdir=pqsql84

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  # patch to remove regress/test make target (won't build with it present)
  #patch -Np1 -i ../build.patch

  # patch for plperl for Perl 5.14
  patch -Np1 -i ../plperl-5.14-8.4.patch

  # configure
  ./configure \
	  --prefix=/usr/${_pqdir} \
	  --with-libxml \
	  --with-openssl \
	  --with-perl \
	  --with-python PYTHON=/usr/bin/python2 \
	  --with-pam \
	  --with-system-tzdata=/usr/share/zoneinfo \
	  --enable-nls \
	  --enable-thread-safety

  sed -i -e '/interfaces/d' src/Makefile

  # build
  make

  # build libs
  for dir in src/interfaces src/bin/pg_config; do
    pushd ${dir}
    make
    popd
  done

  cd src/include
  make

  # build contribs
  cd ../../contrib/
  make
}

package_postgresql84-libs() {
  pkgdesc="Libraries for use with PostgreSQL 8.4"
  depends=('openssl>=1.0.0')

  cd "${srcdir}/${_pkgbase}-${pkgver}"

  # install license
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install libs
  for dir in src/interfaces src/bin/pg_config; do
    pushd ${dir}
    make DESTDIR="${pkgdir}" install
    popd
  done

  install -D -m644 doc/man1/pg_config.1 "${pkgdir}/usr/${_pqdir}/share/man/man1/pg_config.1"

  cd src/include

  mkdir -p "${pkgdir}"/usr/${_pqdir}/include/{libpq,postgresql/internal/libpq}

  # these headers are needed by the public headers of the interfaces
  install -m644 pg_config.h "${pkgdir}/usr/${_pqdir}/include/"
  install -m644 pg_config_os.h "${pkgdir}/usr/${_pqdir}/include/"
  install -m644 postgres_ext.h "${pkgdir}/usr/${_pqdir}/include/"
  install -m644 libpq/libpq-fs.h "${pkgdir}/usr/${_pqdir}/include/libpq/"
  install -m644 pg_config_manual.h "${pkgdir}/usr/${_pqdir}/include/"

  # these headers are needed by the not-so-public headers of the interfaces
  install -m644 c.h "${pkgdir}/usr/${_pqdir}/include/postgresql/internal/"
  install -m644 port.h "${pkgdir}/usr/${_pqdir}/include/postgresql/internal/"
  install -m644 postgres_fe.h "${pkgdir}/usr/${_pqdir}/include/postgresql/internal/"
  install -m644 libpq/pqcomm.h "${pkgdir}/usr/${_pqdir}/include/postgresql/internal/libpq/"
}

package_postgresql84() {
  pkgdesc="A sophisticated object-relational DBMS version 8.4"
  backup=('etc/conf.d/postgresql84' 'etc/pam.d/postgresql84' 'etc/logrotate.d/postgresql84')
  depends=("postgresql84-libs>=${pkgver}" 'libxml2' 'readline>=6.0')
  optdepends=('python2: for PL/Python support'
              'perl: for PL/Perl support')
  provides=('postgresql84-client')
  conflicts=('postgresql84-client')

  cd "${srcdir}/${_pkgbase}-${pkgver}"

  # install
  make DESTDIR="${pkgdir}" install
  # we don't want this, it is in the -libs package
  pushd src/bin/pg_config
  make DESTDIR="${pkgdir}" uninstall
  rm "${pkgdir}/usr/${_pqdir}/share/man/man1/pg_config.1"
  popd

  # install license
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  # install contribs
  cd contrib
  make DESTDIR="${pkgdir}" install

  # create symlinks for 8.4 binaries
  mkdir -p ${pkgdir}/usr/bin

  for bin in $(ls ${pkgdir}/usr/${_pqdir}/bin/); do
	  ln -s /usr/${_pqdir}/bin/$bin ${pkgdir}/usr/bin/${bin}84
  done

  # clean up unneeded installed items
  rm -rf "${pkgdir}/usr/${_pqdir}/include/postgresql/internal"
  rm -rf "${pkgdir}/usr/${_pqdir}/include/libpq"
  find "${pkgdir}/usr/${_pqdir}/include" -maxdepth 1 -type f -execdir rm {} +

  # install launch script
  install -D -m755 "${srcdir}/postgresql84" "${pkgdir}/etc/rc.d/postgresql84"

  # install conf file
  install -D -m644 ${srcdir}/postgresql84.confd \
    "${pkgdir}/etc/conf.d/postgresql84"

  install -D -m644 ${srcdir}/postgresql84.pam \
    "${pkgdir}/etc/pam.d/postgresql84"

  install -D -m644 ${srcdir}/postgresql84.logrotate \
    "${pkgdir}/etc/logrotate.d/postgresql84"

  chown root:root "${pkgdir}"/usr/${_pqdir}/share/doc/postgresql/html/*
}

md5sums=('4603e8ea30cee97189b62b39022f2043'
         'aa60b154a9233e218723d8fb39626bbd'
         '1d9f982cf5800b8b699a39a38bd51e04'
         '4d74f4227dc5e12bf95b3490758d86c9'
         '96f82c38f3f540b53f3e5144900acf17'
         'b365e638136e6394dfeeb3dae1473c79'
         'e44b21275b69cc5157f5f9fae638c8a5')
