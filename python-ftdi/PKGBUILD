#Maintainer: Randy Heydon <randy.heydon at clockworklab dot net>
#Based on the PKGBUILD created for libftdi.
pkgname=python-ftdi
pkgver=0.18
pkgrel=1
pkgdesc="Python bindings to libftdi"
arch=("i686" "x86_64")
url="http://www.intra2net.com/en/developer/libftdi/download.php"
license=("GPL2" "LGPL2.1")
depends=("libftdi")
makedepends=("swig")
options=('!libtool')
source=("http://www.intra2net.com/en/developer/libftdi/download/libftdi-$pkgver.tar.gz")
md5sums=('916f65fa68d154621fc0cf1f405f2726')
sha1sums=('52401db0e7cb90a5d83f82c2859a4f8d44e52579')

build() {
  cd "$srcdir/libftdi-$pkgver"
  sed -i '/no-install/d' examples/Makefile.in
  ./configure --prefix=/usr --enable-python-binding
  make
}

package() {
  cd "$srcdir/libftdi-$pkgver"
  make DESTDIR="$pkgdir" install

  #Strip out all non-python components
  cd $pkgdir
  #rm -r `ls --hide=usr`
  cd usr
  rm -r `ls --hide=lib`
  cd lib
  rm -r `ls --hide=python2.6`
}
