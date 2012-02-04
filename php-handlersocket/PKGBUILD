# Maintainer: Steven Merrill <steven.merrill@gmail.com>

pkgname=php-handlersocket
pkgver=0.3.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A PHP interface to the HandlerSocket MySQL daemon.'
url='http://code.google.com/p/php-handlersocket/'
depends=('php' 'handlersocket-mysql-git')
license='BSD'
source=("http://php-handlersocket.googlecode.com/files/php-handlersocket-${pkgver}.tar.gz")
backup=('etc/php/conf.d/handlersocket.ini')
md5sums=('2ee3dcf0a64a95dbe6ea6cf30a20da1b')

build() {
  cd $srcdir/$pkgname
  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname
  make INSTALL_ROOT=$pkgdir install

  echo 'extension=handlersocket.so' > handlersocket.ini
  install -D -m644 handlersocket.ini $pkgdir/etc/php/conf.d/handlersocket.ini
  install -D -m644 handlersocket.php $pkgdir/usr/share/php-handlersocket/handlersocket.php

  # License
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

