# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: perlawk
pkgname=libv8-juice
pkgver=20101126
pkgrel=1 
pkgdesc="An library extending the V8 engine"
url="http://code.google.com/p/v8-juice/"
arch=(`arch`)
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://v8-juice.googlecode.com/files/libv8-juice-20101126.tar.bz2)
md5sums=('f6187688bdc3a2308b8d4b60982198ee')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
 
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/include

  cp -a src/include/v8 $pkgdir/usr/include
  cp src/client/shell/v8-juice-shell $pkgdir/usr/bin
  cp src/lib/juice/libv8-juice.so $pkgdir/usr/lib
}
