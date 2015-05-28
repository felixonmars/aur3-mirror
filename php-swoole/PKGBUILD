# Maintainer: wolftankk <wolftankk@gmail.com>
pkgname=php-swoole
pkgver=1.7.16
pkgrel=1
pkgdesc="Asynchronous and concurrent and distributed networking framework for PHP."
url="http://pecl.php.net/package/swoole"
arch=('x86_64' 'i686')
license=('PHP')
depends=(
    'php'
)
backup=('etc/php/conf.d/swoole.ini')

source=(
	"http://pecl.php.net/get/swoole-${pkgver}.tgz"
)

sha256sums=('ad280b8c16606d090ffc1542047fcc5cbd93a95f331b3d618cde5f05f130d1ec')

build() {
  cd "$srcdir/swoole-$pkgver"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/swoole-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=swoole.so' > swoole.ini 
  install -Dm644 swoole.ini "$pkgdir/etc/php/conf.d/swoole.ini"
}
