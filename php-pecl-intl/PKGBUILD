pkgname=php-pecl-intl
pkgver=3.0.0
pkgrel=1
pkgdesc="PHP intl PECL extension"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/intl"
license=('BSD')
depends=('php>=5.2.4' 'icu>=4.0')
conflicts=('php-intl')
backup=('etc/php/conf.d/intl.ini')
install=php-pecl-intl.install
source=('intl.ini'
        "http://pecl.php.net/get/intl-$pkgver.tgz")
md5sums=('ddc32a8b38f10b1c22e577d01a288fd2'
         'a6029b9e7b1d0fcdb6e8bfad49e59ae9')

build() {
  cd "$srcdir/intl-$pkgver"

  phpize || return 1
  ./configure --prefix=/usr
  make || return 1
}
package() {
  cd "$srcdir/intl-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  install -D -m644 ../intl.ini "$pkgdir/etc/php/conf.d/intl.ini"
}
