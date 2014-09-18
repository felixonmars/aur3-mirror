# Maintainer: Romain Schmitz <slopjong at slopjong dot de>

pkgname=backuppc-httpd
pkgver=0.2.2
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url="https://github.com/slopjong/backuppc-httpd"
license=('apache')
depends=('apache' 'backuppc' 'mod_perl')
source=(https://github.com/slopjong/backuppc-httpd/archive/$pkgver.tar.gz)
md5sums=('f931f6639d737ecf61b8705a1e4f7035')

build() {
  :
 }
 
package() {
  mkdir -p "$pkgdir"/usr/lib/systemd/system
  mkdir -p "$pkgdir"/etc/httpd/conf/extra
  cd "$srcdir/$pkgname-$pkgver"
  cp httpd/backuppc.conf "$pkgdir"/etc/httpd/conf
  cp httpd/httpd-mpm-backuppc.conf "$pkgdir"/etc/httpd/conf/extra
  cp systemd/httpd-backuppc.service "$pkgdir"/usr/lib/systemd/system
 }