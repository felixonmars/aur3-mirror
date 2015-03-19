# Contributor: Victor Noël

pkgname=yarp
pkgver=2.3.63
pkgrel=1
pkgdesc="Yet Another Robot Platform"
url="http://eris.liralab.it/yarp/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('cmake')
depends=('ace' 'gtkmm' 'gsl')
options=(!libtool)
source=(http://downloads.sourceforge.net/yarp0/$pkgname-$pkgver.tar.gz)
md5sums=('3e0243e09276d716ac317413c753037f')


build() {
  mkdir build-$pkgname-$pkgver
  cd build-$pkgname-$pkgver

  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCREATE_GUIS=TRUE -DCREATE_SHARED_LIBRARY=TRUE -DCREATE_LIB_MATH=TRUE
  make
}

package() {
  cd $srcdir/build-$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
