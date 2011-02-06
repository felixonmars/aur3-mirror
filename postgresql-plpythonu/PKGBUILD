# Contributor: Andrey Smirnov <Smirnov.Andrey@gmail.com>
pkgname=postgresql-plpythonu
pkgver=8.3.5
pkgrel=1
pkgdesc="PL/Python language for postgresql"
license=('BSD')
arch=(i686 x86_64)
url="http://www.postgresql.org/"
depends=('postgresql>=8.3.5')
source=(ftp://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2 )
md5sums=()


build() {
  export MAKEFLAGS="-j1"
  cd ${startdir}/src/postgresql-${pkgver}
  ./configure --prefix=/usr --datadir=/usr/share/postgresql --with-python
  cd src/pl/plpython
  make || return 1
  make DESTDIR=$startdir/pkg install
}
