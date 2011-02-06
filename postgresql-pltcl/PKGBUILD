# Contributor: Sean Sawyer <sean@seansawyer.org>
pkgname=postgresql-pltcl
pkgver=8.3.7
pkgrel=2
pkgdesc="PL/Tcl procedural language for PostgreSQL"
license=('BSD')
arch=(i686 x86_64)
url="http://www.postgresql.org/"
depends=('postgresql>=8.3.7')
source=(ftp://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2 )
md5sums=('7b7e91a2221e55fe1b167e663217a96d')


build() {
  export MAKEFLAGS="-j1"
  cd ${startdir}/src/postgresql-${pkgver}
  ./configure --prefix=/usr --datadir=/usr/share/postgresql --with-tcl
  cd src/pl/tcl
  make || return 1
  make DESTDIR=$startdir/pkg install
}
