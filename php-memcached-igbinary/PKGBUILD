# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-memcached-igbinary
pkgver=2.2.0
pkgrel=1
pkgdesc="PHP extension for interfacing with memcached via libmemcached library (igbinary support)"
url="http://pecl.php.net/package/memcached"
arch=('x86_64' 'i686')
license=('PHP')
depends=(
    'php'
    'memcached'
    'libmemcached'
    'php-igbinary'
)
backup=('etc/php/conf.d/memcached.ini')

source=(
    http://pecl.php.net/get/memcached-${pkgver}.tgz
)

sha256sums=('17b9600f6d4c807f23a3f5c45fcd8775ca2e61d6eda70370af2bef4c6e159f58')

build() {
  cd "$srcdir/memcached-$pkgver"

  phpize
  ./configure --enable-memcached-igbinary --prefix=/usr
  make
}

package() {
  cd "$srcdir/memcached-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=memcached.so' > memcached.ini
  install -Dm644 memcached.ini "$pkgdir/etc/php/conf.d/memcached.ini"
}
