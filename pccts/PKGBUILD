# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <ying@althonx4>
pkgname=pccts  
pkgver=133mr
pkgrel=3 
pkgdesc="Purdue Compler Construction Tools Set, with C/C++ code generation"
url="http://www.antlr2.org/pccts133.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=('http://www.polhode.com/pccts133mr.zip' pccts.1 pccts.patch)
md5sums=('fd70972b0a6aa2d3cf8b5c66d26d229d'
'517f4f7c01626c319f861ae5cc8ef798'
'161172ac41918a36efd1184f5b5ba83d'
)

build() {
  cd $startdir/src
	patch -p0 -i $startdir/pccts.patch
  cd $startdir/src/$pkgname
  sed -e 's/#COPT.*$/COPT=-O2 -DPCCTS_USE_STDARG/' makefile > .tmp
  mv .tmp makefile
  make || return 1
  mkdir -p $pkgdir/usr/include/pccts/antlr
  mkdir -p $pkgdir/usr/include/pccts/sorcerer
  mkdir -p $pkgdir/usr/include/pccts/dlg
  mkdir -p $pkgdir/usr/share/man/man1
  rm bin/empty.txt
  cp -a bin $pkgdir/usr
	cp -a antlr/*h $pkgdir/usr/include/pccts/antlr
	cp -a sorcerer/*.h $pkgdir/usr/include/pccts/sorcerer
	cp -a sorcerer/h/*.h $pkgdir/usr/include/pccts/sorcerer
	cp -a dlg/*h $pkgdir/usr/include/pccts/dlg
	cp -a h/*h h/*.c $pkgdir/usr/include/pccts
	cp -a h/*cpp $pkgdir/usr/include/pccts/antlr
	cp dlg/dlg.1 antlr/antlr.1 $srcdir/pccts.1 $pkgdir/usr/share/man/man1
	gzip $pkgdir/usr/share/man/man1/*.1
}
