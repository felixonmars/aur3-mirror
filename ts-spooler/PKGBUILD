# Maintainer: gnomeye <gnomeye at gmail dot com>
pkgname=ts-spooler
pkgver=0.7.3
pkgrel=1
pkgdesc="task spooler. A simple unix batch system"
arch=('i686' 'x86_64')
url="http://vicerveza.homeunix.net/~viric/soft/ts/"
depends=('glibc')
license=('GPL')
source=(http://vicerveza.homeunix.net/~viric/soft/ts/ts-${pkgver}.tar.gz)
md5sums=('684e1090fbbaf10fd6af52ac38981ba8')

build() {
  cd "$srcdir/ts-$pkgver"
  make
}

package() {
  cd "$srcdir/ts-$pkgver"
  install -D -m755 ts $pkgdir/usr/bin/ts
  install -D -m644 ts.1 $pkgdir/usr/share/man/man1/ts.1
}

