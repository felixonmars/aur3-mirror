# Contributor: Spencer Rinehart <anubis@overthemonkey.com>

pkgname=php-imagick
pkgver=3.1.2
pkgrel=1
pkgdesc="PHP extension for IMagick"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/imagick"
license=('PHP')
depends=('php>=5.1.3' 'imagemagick>=6.2.4')
backup=('etc/php/conf.d/imagick.ini')
install=php-imagick.install
source=("http://pecl.php.net/get/imagick-$pkgver.tgz")
md5sums=('f2fd71b026debe056e0ec8d76c2ffe94')

build() {
  cd "$srcdir/imagick-$pkgver"

  phpize || return 1
  ./configure --prefix=/usr
  make || return 1
  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=imagick.so' > imagick.ini
  install -D -m644 imagick.ini "$pkgdir/etc/php/conf.d/imagick.ini"
}
