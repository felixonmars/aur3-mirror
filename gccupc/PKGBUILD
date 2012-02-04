# Contributor: Eduardo Martins Lopes < edumlopes at gmail dot com >

pkgname=gccupc
pkgver=4.3.2.5
pkgrel=1
pkgdesc="The GCC UPC toolset provides a compilation and execution environment for programs written in the UPC (Unified Parallel C) language"
arch=('i686' 'x86_64')
url="http://www.gccupc.org"
license="GPL"
depends=()
makedepends=()
provides=('upc')
conflicts=()
replaces=()
backup=()
install=
if [ "$CARCH" = "x86_64" ]; then
source=(http://www.gccupc.org/download.php?link=upc-4.3.2.5/upc-4.3.2.5-x86_64-linux-fc11.tar.gz)
md5sums=('56c43996f824018133513deb9dcc6650')
fi

if [ "$CARCH" = "i686" ]; then
source=(http://www.gccupc.org/download.php?link=upc-4.3.2.5/upc-4.3.2.5-i686-linux-centos5.tar.gz)
md5sums=('16aed9bc1232c9548e73c0da854679a0')
fi 

build() {
  
  cp -r $startdir/src/usr $startdir/pkg/
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/man/man1
  ln -s $startdir/usr/local/upc/bin/upc  $startdir/pkg/usr/bin/upc
  ln -s $startdir/usr/local/upc/man/man1/upc.1 $startdir/pkg/usr/man/man1/

}
