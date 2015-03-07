# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Updated by: John C F <john.ch.fr@gmail.com>
pkgname=cudd
pkgver=2.5.1
pkgrel=1
pkgdesc="Package for manipulation of Binary Decision Diagrams (BDDs), Algebraic Decision Diagrams (ADDs) and Zero-suppressed Binary Decision Diagrams (ZDDs)"
arch=('i686' 'x86_64')
url="http://vlsi.colorado.edu/~fabio/CUDD/cuddIntro.html"
license=('unknown')
depends=()
makedepends=(gcc)
source=("ftp://vlsi.colorado.edu/pub/$pkgname-$pkgver.tar.gz"
		Makefile.patch Makefile.i686.patch)
md5sums=('e2a514c2d309feab6b697195b7615b8b'
		 'c5263b595217de72d6cceb99112dda21' '62d23a011d1b36fb501891a68f1361d5')

build() {
  cd "$pkgname-$pkgver"
  patch Makefile ../Makefile.patch
  [ "$CARCH" == "i686" ] && patch Makefile ../Makefile.i686.patch
  for f in  cudd dddmp mtr st util epd
  do
    echo -e "libso:\n\tgcc -shared \$(POBJ) -o ../lib/lib${f}.so\n" >> ${f}/Makefile
  done
  mkdir lib

  make || return 1
  make libso || return 1
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/lib/cudd
  install lib/* $pkgdir/usr/lib/cudd
  mkdir -p $pkgdir/usr/share/licenses/cudd
  install LICENSE $pkgdir/usr/share/licenses/cudd
  mkdir -p $pkgdir/usr/share/cudd/cudd/doc
  cp -r cudd/doc/*  $pkgdir/usr/share/cudd/cudd/doc
  mkdir -p $pkgdir/usr/share/cudd/st/doc
  cp -r st/doc/*  $pkgdir/usr/share/cudd/st/doc
  mkdir -p $pkgdir/usr/share/cudd/mtr/doc
  cp -r mtr/doc/*  $pkgdir/usr/share/cudd/mtr/doc
  mkdir -p $pkgdir/usr/share/cudd/dddmp/doc
  cp -r dddmp/doc/*  $pkgdir/usr/share/cudd/dddmp/doc
  mkdir -p $pkgdir/usr/include/cudd
  cp -L include/* $pkgdir/usr/include/cudd

  #DESTDIR="${pkgdir}" make install
}

