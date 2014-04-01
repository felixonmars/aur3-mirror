# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Testuser_01 <arch@nico-siebler.de>

pkgname=pecl-pthreads
pkgver=2.0.4
pkgrel=1
pkgdesc='Compatible Threading API for PHP5.3+'
arch=('any')
url='http://pecl.php.net/package/pthreads'
license=('PHP')
depends=('php_zts')
makedepends=('autoconf')
source=("http://pecl.php.net/get/pthreads-$pkgver.tgz")
md5sums=('ccf71e9ab439ae47cbba59b5d220a1ba')

package() {
  cd "pthreads-$pkgver"
  export PATH="/usr/bin/php-zts:$PATH"
  phpize
  ./configure --enable-pthreads --enable-maintainer-zts
  make INSTALL_ROOT="$pkgdir" install
} 

# vim:set ts=2 sw=2 et:
