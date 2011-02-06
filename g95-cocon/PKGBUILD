# Contributor: Eduardo Martins Lopes < edumlopes at gmail dot com >

pkgname=g95-cocon
pkgver=0.93
pkgrel=1
pkgdesc="Stable version of G95 - Coarray Fortran compiler including the G95 Coarray Console"
arch=('i686' 'x86_64')
url="http://g95.sourceforge.net"
license="GPL"
depends=('g95' )
makedepends=()
provides=('g95' 'cocon')
conflicts=('g95')
replaces=('g95')
backup=()
install=
if [ "$CARCH" = "i686" ]; then
source=(http://www.g95.org/g95-cocon-x86.tgz)
md5sums=('82b8ee1f6d1e57d3da025fdb3b365122')
fi

if [ "$CARCH" = "x86_64" ]; then
source=(http://www.g95.org/g95-cocon-x86-64.tgz)
md5sums=('2a0407fd10a72b611567eb4b56c69fcb')
fi 

build() {
  
  mkdir $startdir/pkg/usr

if [ "$CARCH" = "i686" ]; then  
  cd $srcdir/g95-coarray
  cp -r $startdir/src/g95-coarray/g95-install/* $startdir/pkg/usr
  cp -r $startdir/src/g95-coarray/cocon $startdir/pkg/usr/bin
  rm $startdir/pkg/usr/{INSTALL,G95Manual.pdf}  
  cd $startdir/pkg/usr/bin
  ar r $srcdir/g95-coarray/g95-install/lib/gcc-lib/x86_64-suse-linux-gnu/4.0.3/libf95.a $srcdir/g95-coarray/coarray.o
  ranlib $startdir/pkg/usr/lib/gcc-lib/x86_64-suse-linux-gnu/4.0.3/libf95.a

  cd $startdir/pkg/usr/bin/ 
  ln -s x86_64-suse-linux-gnu-g95 g95

  
fi

if [ "$CARCH" = "x86_64" ]; then
  cd $srcdir/cocon
  tar -xvf g95-x86-64.tgz
  cp -r $startdir/src/cocon/g95-install/* $startdir/pkg/usr
  cp -r $startdir/src/cocon/cocon $startdir/pkg/usr/bin
  rm $startdir/pkg/usr/{INSTALL,G95Manual.pdf}  
  cd $startdir/pkg/usr/bin
  ar r $srcdir/cocon/g95-install/lib/gcc-lib/x86_64-suse-linux-gnu/4.0.3/libf95.a $srcdir/cocon/coarray.o
  ranlib $startdir/pkg/usr/lib/gcc-lib/x86_64-suse-linux-gnu/4.0.3/libf95.a
  cd $startdir/pkg/usr/bin/
  ln -s x86_64-suse-linux-gnu-g95 g95
fi
}
