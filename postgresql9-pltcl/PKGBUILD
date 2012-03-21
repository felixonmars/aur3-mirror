# Contributor: Sean Sawyer <sean@seansawyer.org>
pkgname=postgresql9-pltcl
pkgver=9.1.3
pkgrel=1
pkgdesc="PL/Tcl procedural language for PostgreSQL"
license=('BSD')
arch=(i686 x86_64)
url="http://www.postgresql.org/"
depends=('postgresql>=9.1.2' 'tcl>=8.5.11')
source=(ftp://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2 )
md5sums=('641e1915f7ebfdc9f138e4c55b6aec0e')


build() {
  export MAKEFLAGS="-j1"
  cd ${startdir}/src/postgresql-${pkgver}
  ./configure --prefix=/usr --datadir=/usr/share/postgresql --with-tcl
  make -C src/backend/ submake-errcodes
  cd src/pl/tcl
  make || return 1
  make DESTDIR=$startdir/pkg install
}
