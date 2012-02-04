# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: perlawk
pkgname=ejs
pkgver=1.1.1
pkgrel=1 
pkgdesc="Ejscript is a powerful server-side JavaScript framework for web applications."
url="http://ejscript.org/software/$pkgname-src-$pkgver-0.tar.gz"
arch=(x86_64 i686)
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://ejscript.org/software/$pkgname-src-$pkgver-0.tar.gz)
md5sums=('f19de4afa7fb1d86436c68146a8beef7')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make -j4 || return 1

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man/man1
  mkdir -p $pkgdir/usr/lib/$pkgname/$pkgver

  cp -a bin doc lib modules src/include $pkgdir/usr/lib/$pkgname/$pkgver
  cp doc/man/* $pkgdir/usr/share/man/man1
  cp -a src/include $pkgdir/usr/lib/$pkgname/$pkgver/inc
  cd $pkgdir/usr/bin
  ln -s ../lib/$pkgname/$pkgver/bin/angel .
  ln -s ../lib/$pkgname/$pkgver/bin/ejs .
  ln -s ../lib/$pkgname/$pkgver/bin/ejsc .
  ln -s ../lib/$pkgname/$pkgver/bin/ejscgi .
  ln -s ../lib/$pkgname/$pkgver/bin/ejsmod .
  ln -s ../lib/$pkgname/$pkgver/bin/ejssql .
  ln -s ../lib/$pkgname/$pkgver/bin/ejsvm .
  ln -s ../lib/$pkgname/$pkgver/bin/ejsweb .
  ln -s ../lib/$pkgname/$pkgver/bin/ejswebserver .
  ln -s ../lib/$pkgname/$pkgver/bin/http .
  ln -s ../lib/$pkgname/$pkgver/bin/makerom .

}