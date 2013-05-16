# $Id: PKGBUILD 3357 2008-06-22 12:46:09Z pierre $
# Maintainer: Simo Leone <simo@archlinux.org>
pkgname=mod_hosts_access
pkgver=1.1.0
pkgrel=3
pkgdesc="TCP wrappers (hosts.deny & hosts.allow) access control for Apache"
url="http://httpd-garage.sourceforge.net/"
license="Apache"
depends=('apache' 'tcp_wrappers')
arch=('i686' 'x86_64')
install=mod_hosts_access.install
source=(http://sourceforge.net/projects/httpd-garage/files/mod_hosts_access/$pkgver/$pkgname-$pkgver.tar.gz/download)
md5sums=('2e4fd22e778c8d98d433344a46421eb7')

build() {
  cd $startdir/src/$pkgname-$pkgver
  apxs -c mod_hosts_access.c -lwrap
  install -D -m755 .libs/mod_hosts_access.so $startdir/pkg/usr/lib/httpd/modules/mod_hosts_access.so
}
