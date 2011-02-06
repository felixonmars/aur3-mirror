# Maintainer: Feng Wang <wanng.fenng AT gmail DOT com>
pkgname=fcpp
pkgname_=FC++
pkgver=1.5
pkgrel=1
pkgdesc="Provides higher-order polymorphic functions in the C++ language."
arch=('i686' 'x86_64')
url="http://www.cc.gatech.edu/~yannis/fc++/"
license=('custom')
source=("http://downloads.sourceforge.net/project/fcpp/fcpp/$pkgname_.$pkgver/$pkgname_.$pkgver.tar.gz")
build() {
  cd $srcdir/$pkgname_.$pkgver

  install -d $pkgdir/usr/include/$pkgname_ \
             $pkgdir/usr/share/licenses/$pkgname_ 
  
  chmod 644 $pkgdir/usr/include/*
  

  msg "Installing documentation and license..."
  install -m644 $srcdir/$pkgname_.$pkgver/*.h $pkgdir/usr/include/$pkgname_
  install -m644 $srcdir/$pkgname_.$pkgver/LICENCE.txt $pkgdir/usr/share/licenses/$pkgname_
}

md5sums=('2f140bc57589cb4f21e844730ba16fad')
