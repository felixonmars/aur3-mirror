# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=libcangjie
pkgver=1.1
pkgrel=1
pkgdesc="CangJie Input Method Library"
arch=('x86_64' 'i686')
url="http://cangjians.github.io/projects/libcangjie/"
license=('LGPL3')
depends=('sqlite')
makedepends=()  
replaces=('libcangjie-git')
sha256sums=('2909722abb9d85e83ad43c8ebd555d057c079014eb8e883c8d0f69b72d23031a')
source=("http://cangjians.github.io/downloads/libcangjie/$pkgname-$pkgver.tar.xz")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
