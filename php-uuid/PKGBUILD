pkgname=php-uuid
pkgver=1.0.3
pkgrel=1
pkgdesc="PHP UUID extension"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/uuid"
license=('LGPL')
depends=('php')
backup=('etc/php/conf.d/uuid.ini')
source=(http://pecl.php.net/get/uuid-$pkgver.tgz)
md5sums=('236c3f2f5c5e9ce0aa2f024618c060a1')

build() {
  cd "$srcdir/uuid-$pkgver"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/uuid-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=uuid.so' > uuid.ini
  install -D -m644 uuid.ini "$pkgdir/etc/php/conf.d/uuid.ini"
}
