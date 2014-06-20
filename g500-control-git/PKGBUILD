# Maintainer: Alex Schneider <schneiderpcc@gmail.com> 

pkgname=g500-control-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Configure Logitech G500's internal profile under Linux (git)"
arch=('i686' 'x86_64')
url="https://github.com/vsht/g500-control"
license=('GPL')
depends=('pacman')
makedepends=('git')
conflicts=('g500_control')
provides=('g500_control')
source=("$pkgname"::'git://github.com/vsht/g500-control.git')
md5sums=('SKIP')
         

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  sed -i 's/usr\/sbin/usr\/bin/' Makefile
  mkdir -p $pkgdir/usr/bin
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
