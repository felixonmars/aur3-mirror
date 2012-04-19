# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=tempi
pkgver=0.1.12
pkgrel=1
pkgdesc="A dataflow programming C++ library aimed at multimodal sampling"
arch=('i686' 'x86_64')
url="http://tempi.toonloop.com/latest/"
license=('GPL3')
depends=('boost-libs' 'clutter' 'liblo' 'libxml2' 'log4cpp' 'stk')
makedepends=('boost')
options=('!libtool')
source=("http://tarballs.quessy.net/$pkgname-$pkgver.tar.gz")
md5sums=('460acd9714d877545cc57acc0d8c76cb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
