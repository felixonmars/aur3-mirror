# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=libcangjie
pkgver=1.0
pkgrel=1
pkgdesc="CangJie Input Method Library"
arch=('x86_64' 'i686')
url="http://cangjians.github.io/projects/libcangjie/"
license=('LGPL3')
depends=('sqlite')
makedepends=()  
replaces=('libcangjie-git')
sha256sums=('8b1d0775d809daa2fda2c2c44a3c5ba7d49cb95b7f2252194899b2a43f6b5baa')
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
