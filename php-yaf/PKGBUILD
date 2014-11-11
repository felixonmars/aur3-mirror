# Maintainer: wolftankk <wolftankk@gmail.com>
pkgname=php-yaf
pkgver=2.3.3
pkgrel=1
pkgdesc="a php framework written in c, built in php-ext"
url="https://github.com/laruence/php-yaf"
arch=('x86_64' 'i686')
license=('PHP')
depends=(
    'php'
)
backup=('etc/php/conf.d/yaf.ini')

source=(
	"https://github.com/laruence/php-yaf/archive/yaf-$pkgver.zip"
)

sha256sums=('34f78e202c618f882444b4f765677bc3ec73481fd837a1136aeaf78b32854fbe')

build() {
  cd "$srcdir/php-yaf-yaf-$pkgver"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/php-yaf-yaf-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=yaf.so' > yaf.ini 
  install -Dm644 yaf.ini "$pkgdir/etc/php/conf.d/yaf.ini"
}
