# $Id$
# Contributor: filip <fila pruda.com>

pkgname=mod_auth_pgsql
pkgver=2.0.3
pkgrel=1
pkgdesc="Apache PostgreSQL Authentication Module"
arch=(i686 x86_64)
url="http://www.giuseppetanzilli.it/mod_auth_pgsql2/"
license=("Apache")
depends=('apache' 'postgresql')
install=mod_auth_pgsql.install
source=(http://www.giuseppetanzilli.it/mod_auth_pgsql2/dist/$pkgname-$pkgver.tar.gz)

md5sums=('d44074b3b9bdb0a5eb9702814872ad43')

build() {
  cd "${srcdir}/$pkgname-${pkgver}"
  
  /usr/sbin/apxs -c -I /usr/include/postgresql -L /usr/lib/postgresql -lpq mod_auth_pgsql.c || return 1
  install -D -m755 .libs/mod_auth_pgsql.so $startdir/pkg/usr/lib/httpd/modules/mod_auth_pgsql.so
}
