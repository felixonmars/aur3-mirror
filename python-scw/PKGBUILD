# Maintainer: William Rea <sillywilly@gmail.com>
pkgname=python-scw
pkgver=0.4.0
pkgrel=1
pkgdesc="Python bindings for scw"
url="http://iki.fi/zuh/scw"
options=('NOLIBTOOL')
license="LGPL"
depends=('pygtk' 'scw')
source=(http://iki.fi/zuh/scw/$pkgname-$pkgver.tar.gz)
md5sums=('0adb33723dda28e9cc7ac7f053bae343')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
