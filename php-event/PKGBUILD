# Maintainer: wolftankk <wolftankk@gmail.com>
pkgname=php-event
pkgver=1.11.1
pkgrel=1
pkgdesc="PHP extension for interfacing with Event"
url="http://pecl.php.net/package/event"
arch=('x86_64' 'i686')
license=('PHP')
depends=(
    'php'
    'libevent'
)
backup=('etc/php/conf.d/event.ini')

source=(
	"http://pecl.php.net/get/event-${pkgver}.tgz"
)

sha256sums=('371e8d559461542058efd57be61fd8316121985dc455f2e7979722e37cedd526')

build() {
  cd "$srcdir/event-$pkgver"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/event-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=event.so' > event.ini 
  install -Dm644 event.ini "$pkgdir/etc/php/conf.d/event.ini"
}
