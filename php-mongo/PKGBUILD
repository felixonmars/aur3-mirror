# Maintainer: Jarek Sedlacek <jareksedlacek@gmail.com>

pkgname=php-mongo
pkgver=1.4.1
pkgrel=1
pkgdesc="Officially supported PHP driver for MongoDB"
arch=("i686" "x86_64")
url="http://www.mongodb.org/display/DOCS/PHP+Language+Center"
license=("APACHE")
depends=("php")
backup=("etc/php/conf.d/mongo.ini")
source=("http://pecl.php.net/get/mongo-$pkgver.tgz"
    "mongo.ini")

build() {
  cd "$srcdir/mongo-$pkgver"
  phpize
  ./configure --prefix=/usr --enable-mongo
}

package(){
  cd "$srcdir/mongo-$pkgver"
  make INSTALL_ROOT=$pkgdir install
  install -Dm644 $srcdir/mongo.ini "$pkgdir/etc/php/conf.d/mongo.ini"

}
md5sums=('45e80d7264388b65a6fcde3f9d4c2c79'
         '07788441b7bd998ee0dea01386b4960a')
