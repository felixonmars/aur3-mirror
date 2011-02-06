# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=xgawk-3.1.6  
pkgver=20080101
pkgrel=2 
arch=('i686' 'x86_64')
pkgdesc="Experimental extension of the GNU Awk interpreter, including a small XML parsing library"
url="http://home.vrweb.de/~juergen.kahrs/gawk/XML/"
depends=('postgresql-libs' 'gd' 'mpfr')
license=('GPL')
source=(http://downloads.sourceforge.net/xmlgawk/$pkgname-$pkgver.tar.gz)
md5sums=('5ec2a31a6a0260822b39e774125c794c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  rm $startdir/pkg/usr/share/info/dir || return 1
}
