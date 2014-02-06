# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=pycangjie
pkgver=1.1
pkgrel=1
pkgdesc="This is a Python wrapper to libcangjie, the library implementing Cangjie and Quick input methods."
arch=('x86_64' 'i686')
url="http://cangjians.github.io/projects/pycangjie/"
license=('LGPL3')
depends=('libcangjie' 'python>=3.2')
makedepends=('cython>=0.17')
replaces=('pycangjie-git')
sha256sums=('97391213ec80f885a5dc8fb9e61f3ab511e8106f3dc924535af41822c0c8ac6f')
source=("http://cangjians.github.io/downloads/pycangjie/cangjie-$pkgver.tar.xz")

check() {
  cd "$srcdir/cangjie-$pkgver"
  make check
}

build() {
  cd "$srcdir/cangjie-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/cangjie-$pkgver"
  make DESTDIR="$pkgdir/" install
}
