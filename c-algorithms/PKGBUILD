# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@farnsworth>
pkgname=c-algorithms  
pkgver=1.2.0
pkgrel=2
pkgdesc="A collection of many common data structures and algorithms for C"
url="http://c-algorithms.sourceforge.net/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('gcc')
conflicts=()
replaces=()
backup=()
install=
source=(http://heanet.dl.sourceforge.net/sourceforge/c-algorithms/$pkgname-$pkgver.tar.gz)
md5sums=('d104d55ee9c97a2766b0850b44b6e85f')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}