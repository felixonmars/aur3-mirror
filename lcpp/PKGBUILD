# Maintainer: Feng Wang <wanng.fenng AT gmail DOT com>
pkgname=lcpp
pkgname_=LC++
pkgver=1.0
pkgrel=1
pkgdesc="LC++ is a library for logic programming in C++. Using LC++, C++ programmers can write declarative, Prolog-like code in their C++ programs. "
arch=('i686' 'x86_64')
url="http://www.cc.gatech.edu/~yannis/lc++/"
license=('unknown')
depends=('fcpp')
source=("http://www.cc.gatech.edu/~yannis/lc++/LC++v1.0/prolog.h")
build() {

  install -d $pkgdir/usr/include/FC++
  chmod 644 $pkgdir/usr/include/FC++

  msg "Installing ..."
  install -m644 $srcdir/prolog.h $pkgdir/usr/include/FC++
}

md5sums=('cf00e58d2be4cecdf656078e78a003e8')
