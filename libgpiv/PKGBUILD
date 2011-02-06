# Contributor: pfm <nl081130@yahoo.de>
pkgname=libgpiv
pkgver=0.6.1
pkgrel=4
pkgdesc="Library for Particle Image Velocimetry."
arch=('i686' 'x86_64')
url="http://libgpiv.sourceforge.net/"
license=('GPL')
depends=('libpng' 'glib2' 'fftw' 'hdf5' 'gsl' 'blas' 'gnuplot' 'netpbm')
source=(http://downloads.sourceforge.net/libgpiv/$pkgname-$pkgver.tar.gz)
md5sums=('3782b0cfb58be3a4871d0b5ab49d6298')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc CPPFLAGS="-DH5_USE_16_API"
  make || return 1
  make DESTDIR="$pkgdir/" install
  rm $pkgdir/usr/lib/libgpiv.la

}