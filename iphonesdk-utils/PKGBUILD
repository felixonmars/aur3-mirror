# Maintainer: yetist <yetist@gmail.com>
pkgname=iphonesdk-utils
pkgver=1.8
pkgrel=2
pkgdesc="collect iOS developer utils under linux"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ios-toolchain-based-on-clang-for-linux"
license=('GPL')
makedepends=('llvm' 'clang')
depends=('ios-toolchain')
optdepends=('ios-sdk4' 'ios-sdk5' 'ios-sdk6')
conflicts=('ldid' 'proj2make')
replaces=('ldid' 'proj2make')
source=("http://ios-toolchain-based-on-clang-for-linux.googlecode.com/files/$pkgname-$pkgver.tar.bz2")
md5sums=('7ccb9384025d6e299405265bca3b5a12')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CC=clang
  export CXX=clang++
  export CFLAGS=-fno-stack-protector
  export CXXFLAGS=-fno-stack-protector
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  export CC=clang
  export CXX=clang++
  export CFLAGS=-fno-stack-protector
  export CXXFLAGS=-fno-stack-protector

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
