# Maintainer: perlawk
pkgname=libgpr
pkgver=1.03
pkgrel=1
pkgdesc="A library for genetic programming, including tree based and Cartesian forms.The aim of libgpr is to make using Genetic Programming easy to include within any C/C++ application."
arch=('x86_64' 'i686')
url="https://github.com/bashrc/libgpr"
license=('LGPL')
option=('gnuplot')
source=("https://github.com/bashrc/libgpr/archive/master.zip")

prepare() {
	cd "$srcdir/$pkgname-master"
  sed -i 's!/local!!; s!lib64!lib!; s/ldconfig/#ldconfig/;' Makefile
}

build() {
	cd "$srcdir/$pkgname-master"
  ./configure --prefix=/usr
  make
}

package() {
	cd "$srcdir/$pkgname-master"
  make DESTDIR="$pkgdir"/ install
  rm -rf $pkgdir/usr/lib/libgpr
}
md5sums=('53f04cd96be4c37c610f6719fec49d8b')
