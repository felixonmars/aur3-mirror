pkgname=fftw2double
pkgver=2.1.5
pkgrel=2
pkgdesc="FFTW is a C subroutine library for computing the discrete Fourier transform (DFT) in one or more dimensions, of both real and complex data, and of arbitrary input size. This is package is offering backwards compatibility version 2.x.y. of fftw."
arch=(i686)
url="http://www.fftw.org/"
depends=('glibc')
makedepends=('gcc>=4.3.0')
source=(http://www.fftw.org/fftw-$pkgver.tar.gz)
md5sums=('8d16a84f3ca02a785ef9eb36249ba433')
license=('GPL')

build() {
  cd $startdir/src/fftw-$pkgver
  # build + install double precision
  ./configure F77=gfortran --prefix=/usr \
              --enable-shared \
                --enable-threads
  make || return 1
  make prefix=$startdir/pkg/usr install || return 1

  make clean

}
