# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=fltk2-static-svn
pkgver=r6921
pkgrel=1
pkgdesc="FLTK s a LGPL'd C++ graphical user interface toolkit for X"
arch=(i686 x86_64)
depends=('libjpeg' 'libpng' 'gcc-libs' 'libxft' 'libxext' 'libxi')
makedepends=('mesa' 'cairo' 'doxygen')	#htmldoc to ps/pdf...?
source=(ftp://ftp.easysw.com/pub/fltk/snapshots/fltk-2.0.x-${pkgver}.tar.gz)
url="http://www.fltk.org/"
license=("LGPL")
options=(docs)

build() {
  local mandir=/usr/share/man
  local docdir=/usr/share/doc/fltk2

  cd $startdir/src/fltk-2.0.x-$pkgver || return 1
  ./configure \
     --prefix=/usr \
     --mandir=$mandir \
     --enable-xft --enable-threads --disable-shared --disable-debug
  make || return 1
  make -e prefix=$startdir/pkg/usr mandir=$startdir/pkg${mandir} \
	  MAN1FILES="fltk2-config.man"				 \
	  install						|| return 1
	#why Makefile or makeinclude don't have MAN1FILES?
  
  cd documentation
  make doxygen_html
  install -d $startdir/pkg${docdir}
  cp -R html/* $startdir/pkg${docdir}
}

md5sums=('bbea214403d37be8a4d2ee16c32f57a2')
