# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=pdcurses-cvs
pkgver=20120611
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Public Domain curses library"
url="http://pdcurses.sourceforge.net/"
license=('public domain' 'MIT')
#depends=('')
makedepends=('cvs')
source=('Makefile.in')
md5sums=('3b264185074378f9e39705b6a4b18964')



build() {
cvs -d:pserver:anonymous:@pdcurses.cvs.sourceforge.net:/cvsroot/pdcurses login 

cvs -d:pserver:anonymous:@pdcurses.cvs.sourceforge.net:/cvsroot/pdcurses co -P PDCurses

  rm -rf $srcdir/build
  cp -ar $srcdir/PDCurses $srcdir/build
  cd $srcdir/build
  cp $srcdir/Makefile.in $srcdir/build/
  ./configure --prefix=/usr --enable-force-utf8
  make 
}

package() {
  cd $srcdir/build

  make install DESTDIR="$pkgdir"

  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname/
  install -m0644 $srcdir/PDCurses/README $startdir/pkg/usr/share/licenses/$pkgname/
}