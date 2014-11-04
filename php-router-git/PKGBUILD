# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>

pkgname=php-router-git
pkgver=r30.f815366
pkgrel=1
pkgdesc="PHP Router: This extension serves to provide a sane, easy router for modern PHP applications"
arch=('i686' 'x86_64')
url="https://github.com/krakjoe/router"
license=('PHP')
depends=('php')
makedepends=('git')
source=("$pkgname"::'git://github.com/krakjoe/router.git')
md5sums=('SKIP')
_ininame="router.ini"
_inifile="etc/php/conf.d/$_ininame"
backup=("$_inifile")

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
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
  echo ";extension=router.so" > "$_ininame"
  install -vDm644 "$_ininame" "$pkgdir/$_inifile"
}
