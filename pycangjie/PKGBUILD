# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=pycangjie
pkgver=1.0
pkgrel=1
pkgdesc="This is a Python wrapper to libcangjie, the library implementing Cangjie and Quick input methods."
arch=('x86_64' 'i686')
url="http://cangjians.github.io/projects/pycangjie/"
license=('LGPL3')
depends=('libcangjie' 'python>=3.2')
makedepends=('cython>=0.17')
replaces=('pycangjie-git')
sha256sums=('076f59809a9602e165591be1301e9ac6a921433f6d58ecd79845b85106949e68')
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
