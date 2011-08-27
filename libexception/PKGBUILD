# Maintainer: napa3um@gmail.com

pkgname=libexception
pkgver=0.2_beta
pkgrel=2
arch=(i686)
pkgdesc="Exception handling library for C"
license=(custom)
url="http://bb.xnull.de/projects/libexception/"
source=(http://bb.xnull.de/projects/libexception/dist/libexception-$pkgver.tar.bz2)
md5sums=('b27f7b97da94f2f44c1c9f3f4d701ef0')
options=(!strip)

build()
{
  cd $srcdir/libexception-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --enable-static || return 1
  make || return 1

#dirty hack for static version (--enable-static not work):
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/include
  mkdir $pkgdir/usr/lib
  ar -r $pkgdir/usr/lib/libexception.a $srcdir/libexception-$pkgver/src/tryenv.o $srcdir/libexception-$pkgver/src/exception.o
  install $srcdir/libexception-$pkgver/src/exception.h $pkgdir/usr/include/exception.h
}
