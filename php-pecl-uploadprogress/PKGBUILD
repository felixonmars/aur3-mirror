# Maintainer: David Roheim <david dot roheim at gmail dot com>
pkgname=php-pecl-uploadprogress
pkgver=1.0.3.1
pkgrel=1
pkgdesc="A PHP extension to track progress of a file upload."
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/uploadprogress"
license=('PHP')
depends=('php>=5.2')
backup=('etc/php/conf.d/uploadprogress.ini')
install=$pkgname.install
source=(http://pecl.php.net/get/uploadprogress-$pkgver.tgz)
sha256sums=('30588b4589543bcf6371532546b1a8cee9da1086c206aca9f96ea1bd486bbab2')

build() {
  cd "$srcdir/uploadprogress-$pkgver"

  phpize || return 1
  ./configure --prefix=/usr
  make || return 1
  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=uploadprogress.so' > uploadprogress.ini
  install -D -m644 uploadprogress.ini "$pkgdir/etc/php/conf.d/uploadprogress.ini"
}
