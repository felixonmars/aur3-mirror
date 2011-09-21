# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=kencc-svn
pkgver=20110920
pkgrel=1
pkgdesc="A port of the plan9 c-compiler"
arch=('i686') #any idea of how to get it to build using multilib?
license=('MIT')
url="http://code.google.com/p/ken-cc/"
depends=('plan9') #9base or plan9port
makedepends=('subversion')
options=(!strip)

source=('configure' 'env')
md5sums=('76f8e3764d9b1096f69560ca5bfe9703' '6d826bf8453de329a867f135031a237a')

build() {
  cd $srcdir


CFLAGS="$CFLAGS -I/opt/plan9/include/ -L/opt/plan9/lib/"
CXXFLAGS=$CFLAGS

  rm -rf $srcdir/build
  cp -ar $srcdir/ken-cc-read-only $srcdir/build
  cd $srcdir/build

  cp $srcdir/configure $srcdir/build/configure
  PATH=$srcdir/build/bin:/opt/plan9/bin:$PATH
  ./configure --host Linux --target Linux --object 386
  mk
  mk install
}

package() {
  mkdir -p $pkgdir/opt/kencc/bin
  mkdir -p $pkgdir/opt/kencc/doc 
  mkdir -p $pkgdir/opt/kencc/include
  mkdir -p $pkgdir/opt/kencc/lib

  install -m755 $srcdir/build/bin/* $pkgdir/opt/kencc/bin/
  install -m755 $srcdir/build/include/* $pkgdir/opt/kencc/include/
  install -m755 $srcdir/build/Linux/386/include/* $pkgdir/opt/kencc/include/
  install -m755 $srcdir/build/Linux/386/lib/* $pkgdir/opt/kencc/lib/

  install -m755 $srcdir/env $pkgdir/opt/kencc/

  install -m644 $srcdir/build/doc/* $pkgdir/opt/kencc/doc/

  install -Dm644 $srcdir/build/NOTICE $pkgdir/usr/share/licences/kencc/NOTICE
}