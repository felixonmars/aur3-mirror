# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Geoff Teale <tealeg@member.fsf.org>
pkgname=ikarus  
pkgver=0.0.3
pkgrel=7  
pkgdesc="Ikarus R6RS Scheme compiler"
url="http://www.cs.indiana.edu/~aghuloum/ikarus/"
arch=('i686')
license=('GPL')
depends=('gmp')
makedepends=("make" "autoconf" "gcc" "gmp")
conflicts=() 
replaces=()
backup=()
install= 
source=("http://www.cs.indiana.edu/~aghuloum/ikarus/$pkgname-$pkgver.tar.gz" ikarus.profile)
md5sums=('6ff12af6342bed7e1ff02a5627b857ab' 'ba82a82640e064a075efe2a6649a52dd')
options=(!docs)
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m755 $startdir/ikarus.profile $startdir/pkg/etc/profile.d/ikarus.sh
  
}