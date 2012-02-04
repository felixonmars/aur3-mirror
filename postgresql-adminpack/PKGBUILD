pkgname=postgresql-adminpack
pkgver=8.2.4
pkgrel=1
pkgdesc="adminpack for postgresql"
arch=(i686 x86_64)
url="http://www.postgresql.org/"
depends=('postgresql')
source=(ftp://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-base-${pkgver}.tar.bz2)
md5sums=('5c0576627c9969a3cedb6b014fb6ae05')

build() {
  export MAKEFLAGS="-j1"

  cd ${startdir}/src/postgresql-${pkgver}
  ./configure --prefix=/usr --with-openssl --datadir=/usr/share/postgresql

  cd ${startdir}/src/postgresql-${pkgver}/contrib/adminpack
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
