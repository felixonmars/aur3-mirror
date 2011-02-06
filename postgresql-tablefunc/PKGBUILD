# Maintainer: Yanchenko Igor <yanchenko.igor@gmail.com>

pkgname=postgresql-tablefunc
pkgver=8.4.4
pkgrel=1
pkgdesc="tablefunc for postgresql"
arch=('i686' 'x86_64')
url="http://www.postgresql.org/"
license=('custom')
depends=('postgresql')
options=('!makeflags')
source=(ftp://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2)
md5sums=('4bf2448ad965bca3940df648c02194df')

build() {
  cd ${startdir}/src/postgresql-$pkgver
  ./configure --prefix=/usr --with-openssl --datadir=/usr/share/postgresql

  cd ${startdir}/src/postgresql-${pkgver}/contrib/tablefunc
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -D -m644 ../../COPYRIGHT $startdir/pkg/usr/share/licenses/$pkgname/COPYRIGHT
}
