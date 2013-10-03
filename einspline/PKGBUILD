# Maintainer: Wolfgang Mader <Wolfgang_Mader at brain-frog dot de>
pkgname=einspline
pkgver=0.9.2
pkgrel=2
pkgdesc="C library for creating and evaluating B-splines"
arch=('i686' 'x86_64')
url="http://einspline.sourceforge.net/index.shtml"
license=('GPL')
makedepends=('gcc-fortran')
optdepends=('fftw: blip-generation facilities')
options=('!libtool')
source=(http://downloads.sourceforge.net/project/einspline/$pkgname-$pkgver.tar.gz)
md5sums=('cdf39d4087f3e6cfae0977a6fe91aebf')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
