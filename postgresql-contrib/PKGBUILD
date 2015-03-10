# $Id: PKGBUILD,v 1.11 2008/06/10 09:30:10 $
# Maintainer: Phil Pirozhkov <pirjsuka@gmail.com>
# Original maintainer: Kravchuk Sergei <alfss.obsd@gmail.com>
#   updated to 9.0.3 by Jonas Weber < mail at jonasw dott de >
pkgname=postgresql-contrib
pkgver=9.4.1
pkgrel=1
pkgdesc="PostgreSQL Contrib Package"
arch=(i686 x86_64)
license=('BSD')
url="http://www.postgresql.org/"
depends=('zlib' 'perl' 'python' 'tcl' 'libxslt' 'pam' 'postgresql>=9.4.1' 'uuid')
options=('!makeflags')
source=(ftp://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2)
md5sums=('2cf30f50099ff1109d0aa517408f8eff')

build() {
  cd $startdir/src/postgresql-$pkgver || return 1

  # (jweber:) had to remove --with-python : -lpython3.2 not found by ld
  ./configure  --prefix=/usr --with-openssl \
     --with-libxml --with-libxslt --with-pam --with-ldap --with-perl --with-tcl \
     --with-ossp-uuid || return 1

  make || return 1

  cd $startdir/src/postgresql-$pkgver/contrib
  make || return 1
}

package() {
  cd $startdir/src/postgresql-$pkgver/contrib
  make DESTDIR=$pkgdir install || return 1
  # rm $pkgdir/usr/lib/postgresql/adminpack.so
  # rm $pkgdir/usr/share/postgresql/extension/adminpack--1.0.sql
  # rm $pkgdir/usr/share/postgresql/extension/adminpack.control
}
