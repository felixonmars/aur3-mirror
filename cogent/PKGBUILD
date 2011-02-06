# Maintainer: jpate <j.k.pate@sms.ed.ac.uk>
pkgname=cogent
pkgver=2.3.9
maintainer="jpate"
pkgrel=1
pkgdesc="A graphical environment for cognitive modeling"
arch=( 'i686' 'x86_64' )
url="http://cogent.psyc.bbk.ac.uk/"
license=('GPL')
depends=( 'gtk' )
makedepends=( 'swi-prolog' )
source=(http://cogent.psyc.bbk.ac.uk/download/unix/cogent-2.3.9-src.tgz)
md5sums=('09954ab1500236b3bb11552019695483')

build() {
  cd $srcdir/

  ## emulate a makefile here...
  mkdir bin
  cd src
  make all
  cd ../oos
  sed -i 's|pl -L4m|swipl -L4m|' Makefile
  make all
  cd ..

  install -d $pkgdir/usr/bin

  install -m 0755 bin/{cogent,oos} $pkgdir/usr/bin

  ## install -d $pkgdir/usr/bin/
  ## install -d $pkgdir/usr/lib/

  ## install -m 0755 bin/{cogent,oos,socket.so} $pkgdir/usr/bin
  ## cp -r lib/* $pkgdir/usr/lib

}

