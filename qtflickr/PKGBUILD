# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=qtflickr
pkgver=1.2
pkgrel=1
pkgdesc="A C++ library for the Flickr API written with the Qt framework."
arch=('i686' 'x86_64')
url="http://qtflickr.com/"
license=('LGPL')
depends=('qt')
source=("http://www.qtflickr.com/$pkgname-$pkgver.zip")
md5sums=('6c8707bf3f046dbb037e219a31a1d208')

build() {
  cd $srcdir/$pkgname
  qmake
  make
}

package() {
  cd $srcdir/$pkgname

  mkdir -p $pkgdir/usr/lib
  install -m755 -D lib/libqtflickr.so.0.1.0 $pkgdir/usr/lib
  install -m644 -D qtflickr.h $pkgdir/usr/include/qtflickr.h

  cd $pkgdir/usr/lib
  ln -s libqtflickr.so.0.1.0 libqtflickr.so
  ln -s libqtflickr.so.0.1.0 libqtflickr.so.0
  ln -s libqtflickr.so.0.1.0 libqtflickr.so.0.1
}
# vim:syntax=sh
