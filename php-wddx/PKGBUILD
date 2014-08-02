# Contributor: Spencer Rinehart <anubis@overthemonkey.com>

_extname=wddx
pkgname=("php-$_extname")
pkgver=5.5.15
pkgrel=1
pkgdesc="PHP extension for wddx"
arch=('i686' 'x86_64')
url='http://www.php.net/wddx'
license=('PHP')
depends=('php')
backup=("etc/php/conf.d/$_extname.ini")
install=php-$_extname.install
source=("http://www.php.net/distributions/php-$pkgver.tar.gz"
        "http://www.php.net/distributions/php-$pkgver.tar.gz.asc")
md5sums=('63b56e64e7c25b1c6dcdf778333dfa24'
         'SKIP')

build() {
  cd "$srcdir/php-$pkgver/ext/$_extname"

  phpize || return 1
  ./configure --prefix=/usr
  make || return 1
  make INSTALL_ROOT="$pkgdir" install
  echo "extension=$_extname.so" > $_extname.ini
  install -D -m644 $_extname.ini "$pkgdir/etc/php/conf.d/$_extname.ini"
}
