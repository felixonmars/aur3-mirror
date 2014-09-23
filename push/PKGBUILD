# Maintainer: perlawk
pkgname=push
pkgver=3.1.0
pkgrel=1
pkgdesc="C++ implementation of the push programming language."
arch=('x86_64' 'i686')
url="http://faculty.hampshire.edu/lspector/push.html"
license=('LGPL')
source="http://nchc.dl.sourceforge.net/project/push-evolve/push-evolve/push-3.1.0/push-3.1.0.tar.gz"

prepare() {
	cd "$srcdir/$pkgname-$pkgver"/extension
  sed -i 's/<string>/<string>\n#include <cstring>/;' pushC.cpp
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
md5sums=('a6483612c840e4e4b895cc5f1ac8ae24')
