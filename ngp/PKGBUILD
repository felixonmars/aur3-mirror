# Maintainer: jklee <klee.jonathan@gmail.com>

pkgname=ngp
pkgver=1.2
pkgrel=1
pkgdesc="Ncurses grep tool"
arch=('i686' 'x86_64')
url="https://github.com/jonathanklee/ngp"
license=('GPL')
depends=('ncurses' 'libconfig' 'automake' 'autoconf' 'gcc' 'make')
makedeps=('git')
source=(http://github.com/jonathanklee/ngp/archive/$pkgver.tar.gz)
md5sums=('241001391e5d4e2233aa5f1ee31c16c1')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
