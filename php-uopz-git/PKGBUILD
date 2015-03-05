# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>

pkgname=php-uopz-git
pkgver=2.0.7.r0.g12fdc21
pkgrel=1
pkgdesc="PHP User Operations for Zend"
arch=('i686' 'x86_64')
url="https://github.com/krakjoe/uopz"
license=('PHP')
depends=('php')
makedepends=('git')
source=("$pkgname"::'git://github.com/krakjoe/uopz.git')
md5sums=('SKIP')
_ininame="uopz.ini"
_inifile="etc/php/conf.d/$_ininame"
backup=("$_inifile")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  phpize
  ./configure --prefix=/usr
  make
  #TEST_PHP_EXECUTABLE=`which php` php run-tests.php
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr INSTALL_ROOT="$pkgdir" install
  echo ";zend_extension=uopz.so" > "$_ininame"
  install -vDm644 "$_ininame" "$pkgdir/$_inifile"
}
