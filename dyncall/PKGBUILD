# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: perlawk
pkgname=dyncall  
pkgver=0.8
pkgrel=1 
pkgdesc="The dyncall library project provides a clean and portable C interface to dynamically issue calls to foreign code using small call kernels written in assembly." 
url="http://dyncall.org/"
arch=('i586' 'x86_64')
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://dyncall.org/r${pkgver}/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make -f Makefile
}
package() {
  cd $startdir/src/$pkgname-$pkgver
  make -f Makefile DESTDIR=$pkgdir/ install
}

md5sums=('945bbc6b7bbcc95aecc2e362ef63ec27')
