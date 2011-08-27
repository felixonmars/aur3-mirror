# Contributor: Stephen Caraher <moskvax@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-gnuplot-mode-cvs
pkgver=20110316
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="A command-line driven interactive function and data plotting utility with many output formats."
url="http://www.gnuplot.info/"
license=('GPL2')
depends=('gnuplot-cvs' 'emacs')
makedepends=('cvs')
conflicts=('gnuplot<4.5')
install=$pkgname.install
source=()
md5sums=()

_cvsmod="gnuplot"
_cvsroot=":pserver:anonymous:@gnuplot.cvs.sourceforge.net:/cvsroot/$_cvsmod"

build() {
  cd $srcdir
  msg "Connecting to gnuplot.cvs.sourceforge.net..."
  if [ -d $_cvsmod/CVS ]; then
    echo "fetching only new files"
    cd $_cvsmod
    cvs -z3 update -d lisp
  else
    echo "fetching whole branch"
    cvs -z3 -d$_cvsroot co -D $pkgver -P $_cvsmod/lisp
  fi

  msg "CVS checkout done or server timeout"

  cd $srcdir/$_cvsmod/lisp
  aclocal
  automake --add-missing
  autoreconf
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$_cvsmod/lisp
  make DESTDIR=$pkgdir install
  install -Dm644 dotemacs $pkgdir/usr/share/emacs/site-lisp/dotemacs.gnuplot
}
